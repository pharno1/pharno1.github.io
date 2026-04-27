
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Christophe DOSSA - Data Analyst</title>

  <style>
    :root{
      --bg:#f4f6f9;
      --ink:#111827;
      --muted:#6b7280;
      --card:#ffffff;
      --nav:#111827;
      --hero:#1f2937;
      --primary:#2563eb;
      --shadow: 0 8px 20px rgba(0,0,0,0.06);
      --radius: 12px;
    }

    * { box-sizing: border-box; }

    html { scroll-behavior: smooth; }

    body {
      margin: 0;
      font-family: Arial, sans-serif;
      background: var(--bg);
      color: var(--ink);
      line-height: 1.6;
    }

    /* NAV */
    nav {
      position: sticky;
      top: 0;
      z-index: 10;
      background: var(--nav);
      padding: 14px 16px;
      text-align: center;
    }
    nav a {
      color: #fff;
      text-decoration: none;
      margin: 0 14px;
      font-weight: 700;
      opacity: 0.95;
    }
    nav a:hover { opacity: 1; text-decoration: underline; }

    /* HERO */
    header {
      background: var(--hero);
      color: #fff;
      padding: 64px 20px;
      text-align: center;
    }
    header h1 {
      margin: 0 0 10px 0;
      font-size: 38px;
      letter-spacing: 0.2px;
    }
    header p {
      margin: 0 auto 18px auto;
      max-width: 820px;
      color: rgba(255,255,255,0.9);
      font-size: 16px;
    }

    .badge {
      display: inline-block;
      padding: 6px 10px;
      border-radius: 999px;
      background: rgba(255,255,255,0.12);
      border: 1px solid rgba(255,255,255,0.18);
      font-size: 13px;
      margin-bottom: 14px;
    }

    .hero-actions {
      margin-top: 18px;
      display: flex;
      gap: 12px;
      justify-content: center;
      flex-wrap: wrap;
    }

    .btn {
      display: inline-block;
      padding: 11px 16px;
      border-radius: 10px;
      text-decoration: none;
      font-weight: 700;
      border: 1px solid transparent;
      transition: transform 0.08s ease, opacity 0.15s ease, background 0.15s ease;
    }
    .btn:hover { transform: translateY(-1px); }
    .btn-primary {
      background: var(--primary);
      color: #fff;
    }
    .btn-primary:hover { opacity: 0.95; }
    .btn-ghost {
      background: rgba(255,255,255,0.10);
      color: #fff;
      border-color: rgba(255,255,255,0.20);
    }
    .btn-ghost:hover { background: rgba(255,255,255,0.14); }

    /* LAYOUT */
    main {
      max-width: 980px;
      margin: 0 auto;
      padding: 34px 18px 10px;
    }

    section { margin: 26px 0; }
    h2 {
      margin: 0 0 12px 0;
      font-size: 22px;
    }

    .card {
      background: var(--card);
      padding: 20px;
      border-radius: var(--radius);
      box-shadow: var(--shadow);
    }

    .grid {
      display: grid;
      grid-template-columns: 1fr;
      gap: 16px;
    }

    @media (min-width: 820px) {
      .grid-2 { grid-template-columns: 1fr 1fr; }
      .grid-3 { grid-template-columns: 1fr 1fr 1fr; }
    }

    .muted { color: var(--muted); }

    .chip {
      display: inline-block;
      margin: 6px 8px 0 0;
      padding: 6px 10px;
      border-radius: 999px;
      background: #eef2ff;
      color: #1e3a8a;
      font-size: 13px;
      font-weight: 700;
    }

    .project-title {
      margin: 0 0 6px 0;
      font-size: 16px;
    }

    .project-meta {
      margin: 0 0 10px 0;
      color: var(--muted);
      font-size: 13px;
    }

    .link {
      color: var(--primary);
      text-decoration: none;
      font-weight: 700;
    }
    .link:hover { text-decoration: underline; }

    footer {
      text-align: center;
      padding: 22px 10px;
      color: var(--muted);
      font-size: 13px;
      margin-top: 24px;
    }

    .contact-links a{
      display: inline-block;
      margin-right: 16px;
      text-decoration: none;
      font-weight: 800;
      color: var(--primary);
    }
    .contact-links a:hover{ text-decoration: underline; }
  </style>
</head>

<body>

  <nav>
    <a href="#about">À propos</a>
    <a href="#skills">Compétences</a>
    <a href="#projects">Projets</a>
    <a href="#contact">Contact</a>
  </nav>

  <header>
    <div class="badge">Disponible immédiatement • Mobilité France entière</div>
    <h1>Christophe DOSSA</h1>
    <p>Data Analyst orienté <b>BI & reporting</b> — j’aide les équipes métiers à piloter la performance avec des données fiables, des dashboards clairs et des flux automatisés.</p>

    <div class="hero-actions">
      <a class="btn btn-primary" href="./DOSSA_Christophe_Data_Analyst.pdf" target="_blank" rel="noopener">
        Télécharger mon CV
      </a>

      <a class="btn btn-ghost" href="https://www.linkedin.com/in/aime-christophe-dossa/" target="_blank" rel="noopener">
        🔗 LinkedIn
      </a>

      <a class="btn btn-ghost" href="https://github.com/pharno1" target="_blank" rel="noopener">
        💻 GitHub
      </a>
      <a class="btn btn-ghost" href="./projects.html">
      📌 Projets détaillés
      </a>
    </div>
  </header>

  <main>

    <section id="about">
      <h2>À propos</h2>
      <div class="card">
        <p>
          Data Analyst spécialisé en Business Intelligence et pilotage de la performance, avec une expérience en environnement retail national (300+ magasins).
          J’interviens sur la conception de reporting & dashboards, l’analyse de KPI business, et l’automatisation des flux de données (API / ETL/ELT).
        </p>
        <p class="muted" style="margin:0;">
          Objectif : transformer la donnée en décisions actionnables — claires, fiables, et orientées impact métier.
        </p>
      </div>
    </section>

    <section id="skills">
      <h2>Compétences</h2>
      <div class="grid grid-2">
        <div class="card">
          <h3 style="margin:0 0 8px 0;">Analyse & BI</h3>
          <div>
            <span class="chip">Power BI</span>
            <span class="chip">Looker Studio</span>
            <span class="chip">Tableau</span>
            <span class="chip">Excel (TCD/VBA)</span>
            <span class="chip">KPI & performance</span>
          </div>
        </div>

        <div class="card">
          <h3 style="margin:0 0 8px 0;">Data & Tech</h3>
          <div>
            <span class="chip">SQL (PostgreSQL/MySQL)</span>
            <span class="chip">Python (pandas)</span>
            <span class="chip">API</span>
            <span class="chip">ETL/ELT</span>
            <span class="chip">Supabase</span>
          </div>
        </div>
      </div>

      <div class="grid grid-2" style="margin-top:16px;">
        <div class="card">
          <h3 style="margin:0 0 8px 0;">Cloud</h3>
          <div>
            <span class="chip">AWS (S3, Athena, Redshift)</span>
            <span class="chip">Azure (Data Factory)</span>
            <span class="chip">GCP (bases)</span>
          </div>
        </div>

        <div class="card">
          <h3 style="margin:0 0 8px 0;">Plus</h3>
          <div>
            <span class="chip">R</span>
            <span class="chip">SAS</span>
            <span class="chip">MongoDB</span>
            <span class="chip">Google Analytics</span>
          </div>
        </div>
      </div>
    </section>

    <section id="projects">
      <h2>Projets</h2>

      <div class="grid grid-3">
        <div class="card">
          <h3 class="project-title">Dashboard Performance Retail</h3>
          <p class="project-meta">Power BI • KPI • Pilotage ventes</p>
          <p>Suivi des ventes et indicateurs clés pour un réseau de 300+ magasins : vues décisionnelles, analyse des écarts et monitoring quotidien.</p>
          <p class="muted" style="margin:0;">(Ajoute ensuite une capture Power BI + un lien vers une page projet)</p>
        </div>

        <div class="card">
          <h3 class="project-title">Automatisation API → Cube BI</h3>
          <p class="project-meta">API • ETL/ELT • AWS • Sage BI</p>
          <p>Automatisation et fiabilisation des flux achats pour alimenter un cube BI : amélioration de la qualité des données et du pilotage achats.</p>
          <p class="muted" style="margin:0;">(Ajoute un schéma d’architecture simple)</p>
        </div>

        <div class="card">
          <h3 class="project-title">Analyse Python & Modélisation</h3>
          <p class="project-meta">Python • pandas • scikit-learn</p>
          <p>Nettoyage, exploration, visualisation et modélisation sur dataset : pipeline simple et reproductible, avec résultats interprétables.</p>
          <p class="muted" style="margin:0;">(Ajoute un lien GitHub vers le notebook)</p>
        </div>
      </div>
    </section>

    <section id="contact">
      <h2>Contact</h2>
      <div class="card">
        <p style="margin-top:0;"><b>Email :</b> aimechristophedossa@gmail.com</p>

        <div class="contact-links">
          <a href="https://www.linkedin.com/in/aimé-christophe-dossa/" target="_blank" rel="noopener">🔗 LinkedIn</a>
          <a href="https://github.com/pharno1" target="_blank" rel="noopener">💻 GitHub</a>
          <a href="./DOSSA_Christophe_Data_Analyst.pdf" target="_blank" rel="noopener">📄 CV (PDF)</a>
        </div>

        <p class="muted" style="margin-bottom:0;margin-top:14px;">
          N’hésite pas à me contacter pour un poste Data Analyst / BI (CDI) ou une mission orientée reporting & performance.
        </p>
      </div>
    </section>

    <footer>
      © 2026 Christophe DOSSA • Portfolio Data Analyst
    </footer>

  </main>
</body>
</html>
