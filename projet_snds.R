# 1. Sélectionner les archives
# Première fenêtre : choisir BENEFICIAIRE_Tables_CSV.zip
zip_beneficiaires <- file.choose()

# Deuxième fenêtre : choisir MCO_Tables_CSV.zip
zip_mco <- file.choose()


# 2. Décompresser dans un dossier temporaire
dossier <- file.path(tempdir(), "projet_snds")
dir.create(dossier, showWarnings = FALSE)

unzip(zip_beneficiaires, exdir = dossier)
unzip(zip_mco, exdir = dossier)


# 3. Importer les quatre tables
# On conserve d'abord toutes les colonnes en texte :
# cela préserve notamment les zéros au début des codes.

beneficiaires <- read.csv2(
  file.path(dossier, "BENEFICIAIRE", "IR_BEN_R.csv"),
  colClasses = "character",
  stringsAsFactors = FALSE
)

sejours <- read.csv2(
  file.path(dossier, "MCO", "T_MCOaaB.csv"),
  colClasses = "character",
  stringsAsFactors = FALSE
)

chainage <- read.csv2(
  file.path(dossier, "MCO", "T_MCOaaC.csv"),
  colClasses = "character",
  stringsAsFactors = FALSE
)

diagnostics <- read.csv2(
  file.path(dossier, "MCO", "T_MCOaaD.csv"),
  colClasses = "character",
  stringsAsFactors = FALSE
)

inventaire <- data.frame(
  Table = c("Bénéficiaires", "Séjours",
            "Chaînage", "Diagnostics associés"),
  Lignes = c(nrow(beneficiaires), nrow(sejours),
             nrow(chainage), nrow(diagnostics)),
  Colonnes = c(ncol(beneficiaires), ncol(sejours),
               ncol(chainage), ncol(diagnostics))
)

print(inventaire)

# Caractéristiques des bénéficiaires
head(beneficiaires[, c(
  "BEN_NIR_PSA", "BEN_NAI_ANN", "BEN_SEX_COD"
)])

# Informations sur les séjours
head(sejours[, c(
  "ETA_NUM", "RSA_NUM", "AGE_ANN",
  "COD_SEX", "DGN_PAL", "SEJ_NBJ"
)])

# Colonnes disponibles pour le chaînage
names(chainage)

# Diagnostics associés
head(diagnostics)

# Vérifier les valeurs manquantes dans les clés

sum(is.na(sejours$ETA_NUM) | trimws(sejours$ETA_NUM) == "")
sum(is.na(sejours$RSA_NUM) | trimws(sejours$RSA_NUM) == "")

sum(is.na(chainage$ETA_NUM) | trimws(chainage$ETA_NUM) == "")
sum(is.na(chainage$RSA_NUM) | trimws(chainage$RSA_NUM) == "")

# Nombre de lignes dont la clé de séjour a déjà été rencontrée

sum(duplicated(sejours[, c("ETA_NUM", "RSA_NUM")]))

sum(duplicated(chainage[, c("ETA_NUM", "RSA_NUM")]))
# Valeurs manquantes ou vides

sum(is.na(beneficiaires$BEN_NIR_PSA) |
      trimws(beneficiaires$BEN_NIR_PSA) == "")

# Identifiants déjà rencontrés

sum(duplicated(beneficiaires$BEN_NIR_PSA))

# Comparer les clés des tables sejours et chainage

cles_sejours <- sejours[, c("ETA_NUM", "RSA_NUM")]
cles_chainage <- chainage[, c("ETA_NUM", "RSA_NUM")]

# Séjours dont la clé existe dans les deux tables
correspondances <- merge(
  cles_sejours,
  cles_chainage,
  by = c("ETA_NUM", "RSA_NUM")
)

nrow(correspondances)

# Clés de sejours absentes de chainage
nrow(sejours) - nrow(correspondances)

# Clés de chainage absentes de sejours
nrow(chainage) - nrow(correspondances)

# Nombre de lignes de chaînage avec un identifiant manquant ou vide
sum(is.na(chainage$NIR_ANO_17) |
      trimws(chainage$NIR_ANO_17) == "")

# Nombre de lignes de chaînage dont l'identifiant patient
# est présent dans la table beneficiaires
sum(
  !is.na(chainage$NIR_ANO_17) &
    trimws(chainage$NIR_ANO_17) != "" &
    chainage$NIR_ANO_17 %in% beneficiaires$BEN_NIR_PSA
)

# Nombre de lignes de chaînage avec un identifiant renseigné
# mais absent de la table beneficiaires
sum(
  !is.na(chainage$NIR_ANO_17) &
    trimws(chainage$NIR_ANO_17) != "" &
    !(chainage$NIR_ANO_17 %in% beneficiaires$BEN_NIR_PSA)
)

# Sélection des informations utiles au chaînage
chainage_selection <- chainage[, c(
  "ETA_NUM", "RSA_NUM", "NIR_ANO_17",
  "EXE_SOI_DTD", "EXE_SOI_DTF"
)]

# Jointure : informations du séjour + identifiant patient et dates
base_sejours <- merge(
  sejours,
  chainage_selection,
  by = c("ETA_NUM", "RSA_NUM"),
  all.x = TRUE,
  sort = FALSE
)

# Vérifier le nombre de lignes avant et après
nrow(sejours)
nrow(base_sejours)


# Sélection des variables des bénéficiaires
beneficiaires_selection <- beneficiaires[, c(
  "BEN_NIR_PSA", "BEN_NAI_ANN", "BEN_SEX_COD"
)]

# Jointure : NIR_ANO_17 correspond à BEN_NIR_PSA
base_patient_sejour <- merge(
  base_sejours,
  beneficiaires_selection,
  by.x = "NIR_ANO_17",
  by.y = "BEN_NIR_PSA",
  all.x = TRUE,
  sort = FALSE
)

# Vérifier le nombre de lignes
nrow(base_patient_sejour)

# Choisir quelques colonnes pour la lecture
base_lecture <- base_patient_sejour[, c(
  "NIR_ANO_17", "ETA_NUM", "RSA_NUM",
  "BEN_NAI_ANN", "BEN_SEX_COD",
  "AGE_ANN", "DGN_PAL", "SEJ_NBJ",
  "EXE_SOI_DTD", "EXE_SOI_DTF"
)]

head(base_lecture)

# Convertir les dates au format Date
base_lecture$date_entree <- as.Date(
  base_lecture$EXE_SOI_DTD,
  format = "%d/%m/%Y"
)

base_lecture$date_sortie <- as.Date(
  base_lecture$EXE_SOI_DTF,
  format = "%d/%m/%Y"
)

# Vérifier les premières dates converties
head(base_lecture[, c(
  "EXE_SOI_DTD", "date_entree",
  "EXE_SOI_DTF", "date_sortie"
)])

# Nombre de dates manquantes après conversion
sum(is.na(base_lecture$date_entree))
sum(is.na(base_lecture$date_sortie))

# Nombre de sorties antérieures aux entrées
sum(
  base_lecture$date_sortie < base_lecture$date_entree,
  na.rm = TRUE
)
# Convertir l'année de naissance en nombre
base_lecture$annee_naissance <- as.numeric(
  base_lecture$BEN_NAI_ANN
)

# Extraire l'année de la date d'entrée
base_lecture$annee_entree <- as.numeric(
  format(base_lecture$date_entree, "%Y")
)

# Nombre de séjours dont l'année d'entrée précède
# l'année de naissance du bénéficiaire
sum(
  base_lecture$annee_entree < base_lecture$annee_naissance,
  na.rm = TRUE
)
# Créer l'année de naissance à partir de la colonne d'origine
base_lecture$annee_naissance <- as.numeric(
  base_lecture$BEN_NAI_ANN
)

# Extraire l'année de la date d'entrée
base_lecture$annee_entree <- as.numeric(
  format(base_lecture$date_entree, "%Y")
)

# Vérifier les premières valeurs
head(base_lecture[, c(
  "BEN_NAI_ANN", "annee_naissance",
  "date_entree", "annee_entree"
)])

# Compter les années manquantes après conversion
sum(is.na(base_lecture$annee_naissance))
sum(is.na(base_lecture$annee_entree))

# Compter les séjours dont l'année d'entrée
# précède l'année de naissance
sum(
  base_lecture$annee_entree < base_lecture$annee_naissance,
  na.rm = TRUE
)

# Repérer les séjours avant l'année de naissance
avant_naissance <- base_lecture[
  !is.na(base_lecture$annee_entree) &
    !is.na(base_lecture$annee_naissance) &
    base_lecture$annee_entree < base_lecture$annee_naissance,
  c("NIR_ANO_17", "annee_naissance", "date_entree")
]

head(avant_naissance)

# Nombre total de séjours avant l'année de naissance
nrow(avant_naissance)

# Proportion parmi tous les séjours
round(nrow(avant_naissance) / nrow(base_lecture) * 100, 1)
# Nombre de bénéficiaires distincts
length(unique(avant_naissance$NIR_ANO_17))

# Convertir la durée renseignée en nombre
base_lecture$duree_renseignee <- as.numeric(
  base_lecture$SEJ_NBJ
)

# Calculer la différence entre la sortie et l'entrée
base_lecture$duree_calculee <- as.numeric(
  base_lecture$date_sortie - base_lecture$date_entree
)

# Voir quelques comparaisons
head(base_lecture[, c(
  "date_entree", "date_sortie",
  "duree_renseignee", "duree_calculee"
)])

# Nombre de durées manquantes après conversion
sum(is.na(base_lecture$duree_renseignee))
sum(is.na(base_lecture$duree_calculee))

# Nombre de lignes avec deux durées disponibles et différentes
sum(
  !is.na(base_lecture$duree_renseignee) &
    !is.na(base_lecture$duree_calculee) &
    base_lecture$duree_renseignee != base_lecture$duree_calculee
)

durees_differentes <- base_lecture[
  !is.na(base_lecture$duree_renseignee) &
    !is.na(base_lecture$duree_calculee) &
    base_lecture$duree_renseignee != base_lecture$duree_calculee,
  c("ETA_NUM", "RSA_NUM", "date_entree", "date_sortie",
    "duree_renseignee", "duree_calculee")
]

head(durees_differentes)

# Tableau de synthèse des contrôles réalisés

synthese_qualite <- data.frame(
  Controle = c(
    "Année d'entrée avant l'année de naissance",
    "Durée renseignée différente de la durée calculée"
  ),
  Nombre = c(
    nrow(avant_naissance),
    nrow(durees_differentes)
  ),
  Total_sejours = c(
    nrow(base_lecture),
    nrow(base_lecture)
  )
)

# Ajouter le pourcentage
synthese_qualite$Pourcentage <- round(
  synthese_qualite$Nombre / synthese_qualite$Total_sejours * 100,
  1
)

# Afficher le tableau
print(synthese_qualite)


# Graphique des résultats des contrôles qualité

barplot(
  height = synthese_qualite$Pourcentage,
  names.arg = c(
    "Entrée avant\nnaissance",
    "Durées\ndifférentes"
  ),
  main = "Contrôles de cohérence des données synthétiques",
  ylab = "Pourcentage de séjours concernés",
  ylim = c(0, 110),
  col = c("steelblue", "darkorange")
)

# Ajouter les pourcentages au-dessus des barres
text(
  x = c(0.7, 1.9),
  y = synthese_qualite$Pourcentage + 5,
  labels = paste0(synthese_qualite$Pourcentage, " %")
)

#######################################################
# Nombre de lignes dans la table diagnostics
nrow(diagnostics)

# Vérifier les clés manquantes ou vides
sum(is.na(diagnostics$ETA_NUM) |
      trimws(diagnostics$ETA_NUM) == "")

sum(is.na(diagnostics$RSA_NUM) |
      trimws(diagnostics$RSA_NUM) == "")

# Nombre de lignes dont la clé de séjour a déjà été rencontrée
sum(duplicated(diagnostics[, c("ETA_NUM", "RSA_NUM")]))

# Garder une seule fois chaque clé de séjour présente
# dans la table diagnostics
cles_diagnostics <- unique(
  diagnostics[, c("ETA_NUM", "RSA_NUM")]
)

# Rechercher les clés présentes dans les deux tables
cles_communes <- merge(
  cles_diagnostics,
  cles_sejours,
  by = c("ETA_NUM", "RSA_NUM")
)

# Nombre de clés distinctes dans diagnostics
nrow(cles_diagnostics)

# Nombre de clés distinctes retrouvées dans sejours
nrow(cles_communes)

# Nombre de clés distinctes de diagnostics sans séjour correspondant
nrow(cles_diagnostics) - nrow(cles_communes)


# Sélectionner les clés et le diagnostic associé
diagnostics_selection <- diagnostics[, c(
  "ETA_NUM", "RSA_NUM", "ASS_DGN"
)]

# Ajouter le diagnostic associé à la base patient-séjour
base_complete <- merge(
  base_lecture,
  diagnostics_selection,
  by = c("ETA_NUM", "RSA_NUM"),
  all.x = TRUE,
  sort = FALSE
)

# Comparer le nombre de lignes avant et après
nrow(base_lecture)
nrow(base_complete)

head(base_complete[, c(
  "ETA_NUM", "RSA_NUM",
  "DGN_PAL", "ASS_DGN"
)])

sum(
  is.na(base_complete$ASS_DGN) |
    trimws(base_complete$ASS_DGN) == ""
)