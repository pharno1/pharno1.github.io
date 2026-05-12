<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Christophe DOSSA - Data Analyst</title>

  <style>
    :root {
      --bg: #f4f6f9;
      --ink: #111827;
      --muted: #6b7280;
      --card: #ffffff;
      --nav: #111827;
      --hero: #1f2937;
      --primary: #2563eb;
      --shadow: 0 8px 20px rgba(0, 0, 0, 0.06);
      --radius: 14px;
    }

    * {
      box-sizing: border-box;
    }

    html {
      scroll-behavior: smooth;
    }

    body {
      margin: 0;
      font-family: Arial, sans-serif;
      background: var(--bg);
      color: var(--ink);
      line-height: 1.6;
    }

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

    nav a:hover {
      opacity: 1;
      text-decoration: underline;
    }

    header {
      background: var(--hero);
      color: #fff;
      padding: 70px 20px;
      text-align: center;
    }

    header h1 {
      margin: 0 0 10px 0;
      font-size: 42px;
    }

    header p {
      margin: 0 auto 18px auto;
      max-width: 820px;
      color: rgba(255, 255, 255, 0.9);
      font-size: 17px;
    }

    .badge {
      display: inline-block;
      padding: 6px 10px;
      border-radius: 999px;
      background: rgba(255, 255, 255, 0.12);
      border: 1px solid rgba(255, 255, 255, 0.18);
      font-size: 13px;
      margin-bottom: 14px;
    }

    .hero-actions {
      margin-top: 20px;
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
      transition: 0.2s;
    }

    .btn:hover {
      transform: translateY(-2px);
    }

    .btn-primary {
      background: var(--primary);
      color: white;
    }

    .btn-ghost {
      background: rgba(255, 255, 255, 0.1);
      color: white;
      border-color: rgba(255, 255, 255, 0.2);
    }

    main {
      max-width: 1180px;
      margin: auto;
      padding: 34px 18px;
    }

    section {
      margin: 32px 0;
    }

    h2 {
      font-size: 28px;
      margin-bottom: 18px;
    }

    .card {
      background: var(--card);
      border-radius: var(--radius);
      padding: 24px;
      box-shadow: var(--shadow);
    }

    .grid {
      display: grid;
      gap: 20px;
    }

    .grid-2 {
      grid-template-columns: 1fr;
    }

    @media(min-width: 900px) {
      .grid-2 {
        grid-template-columns: 1fr 1fr;
      }
    }

    .muted {
      color: var(--muted);
    }

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
      font-size: 22px;
    }

    .project-meta {
      margin-bottom: 14px;
      color: var(--muted);
      font-size: 14px;
    }

    .project-image {
      width: 100%;
      border-radius: 14px;
      margin-top: 16px;
      border: 1px solid #e5e7eb;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
    }

    .project-links {
      margin-top: 18px;
      display: flex;
      gap: 10px;
      flex-wrap: wrap;
    }

    .link-btn {
      display: inline-block;
      padding: 10px 14px;
      border-radius: 10px;
      text-decoration: none;
      font-weight: bold;
      background: #eef2ff;
      color: #1e3a8a;
    }

    .link-btn:hover {
      background: #dbeafe;
    }

    footer {
      text-align: center;
      padding: 24px 10px;
      color: var(--muted);
      font-size: 13px;
      margin-top: 30px;
    }

    .contact-links a {
      display: inline-block;
      margin-right: 16px;
      text-decoration: none;
      font-weight: bold;
      color: var(--primary);
    }

    .contact-links a:hover {
      text-decoration: underline;
    }
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

    <div class="badge">
      Disponible immédiatement • Mobilité France entière
    </div>

    <h1>Christophe DOSSA</h1>

    <p>
      Data Analyst orienté <b>BI & Reporting</b> — spécialisé dans
      l’analyse de performance, l’automatisation des flux de données
      et le développement de dashboards interactifs.
    </p>

    <div class="hero-actions">

      <a class="btn btn-primary"
         href="./DOSSA_Christophe_Data_Analyst.pdf"
         target="_blank">
        📄 Télécharger mon CV
      </a>

      <a class="btn btn-ghost"
         href="https://www.linkedin.com/in/aime-christophe-dossa/"
         target="_blank">
        🔗 LinkedIn
      </a>

      <a class="btn btn-ghost"
         href="https://github.com/pharno1"
         target="_blank">
        💻 GitHub
      </a>

      <a class="btn btn-ghost"
         href="./projects.html">
        📌 Projets détaillés
      </a>

    </div>

  </header>

  <main>

    <!-- ABOUT -->
    <section id="about">

      <h2>À propos</h2>

      <div class="card">

        <p>
          Data Analyst spécialisé en Business Intelligence et pilotage
          de la performance, avec une expérience en environnement retail national
          (300+ magasins).
        </p>

        <p class="muted">
          J’interviens sur la conception de dashboards, l’analyse de KPI business,
          l’automatisation des flux de données et la structuration d’architectures data.
        </p>

      </div>

    </section>

    <!-- SKILLS -->
    <section id="skills">

      <h2>Compétences</h2>

      <div class="grid grid-2">

        <div class="card">
          <h3>Analyse & BI</h3>

          <span class="chip">Power BI</span>
          <span class="chip">Looker Studio</span>
          <span class="chip">Tableau</span>
          <span class="chip">Excel VBA</span>
          <span class="chip">KPI</span>
        </div>

        <div class="card">
          <h3>Data & Tech</h3>

          <span class="chip">Python</span>
          <span class="chip">pandas</span>
          <span class="chip">SQL</span>
          <span class="chip">API</span>
          <span class="chip">ETL/ELT</span>
          <span class="chip">Supabase</span>
        </div>

      </div>

    </section>

    <!-- PROJECTS -->
    <section id="projects">

      <h2>Projets</h2>

      <div class="grid grid-2">

        <!-- PROJET 1 -->
        <div class="card">

          <h3 class="project-title">
            Projet 1 — Dashboard Performance Retail
          </h3>

          <p class="project-meta">
            Power BI • KPI • Streamlit • Retail Analytics
          </p>

          <p>
            Développement d’un dashboard interactif permettant de suivre
            la performance commerciale d’un réseau de plus de 300 magasins.
          </p>

          <img src="screenshot_dashboard_process.png"
               alt="Projet Dashboard Retail"
               class="project-image">

          <div class="project-links">

            <a class="link-btn"
               href="https://dashboard-performance-retail.streamlit.app/"
               target="_blank">
              🚀 Dashboard live
            </a>

            <a class="link-btn"
               href="https://github.com/pharno1/dashboard-performance-retail"
               target="_blank">
              💻 Code GitHub
            </a>

          </div>

        </div>

        <!-- PROJET 3 -->
        <div class="card">

          <h3 class="project-title">
            Projet 3 — Analyse Python & Dashboard Streamlit
          </h3>

          <p class="project-meta">
            Python • pandas • Streamlit • Data Cleaning
          </p>

          <p>
            Nettoyage, transformation et visualisation de données retail
            avec développement d’une application Streamlit interactive.
          </p>

          <img src="screenshot_dashboard_p3_process.png"
               alt="Projet Python Streamlit"
               class="project-image">

          <div class="project-links">

            <a class="link-btn"
               href="https://analyse-retail.streamlit.app/"
               target="_blank">
              🚀 Application live
            </a>

            <a class="link-btn"
               href="https://github.com/pharno1/analyse-retail"
               target="_blank">
              💻 Code GitHub
            </a>

          </div>

        </div>

      </div>

      <!-- PROJET 2 -->
      <div class="card" style="margin-top:22px;">

        <h3 class="project-title">
          Projet 2 — Automatisation API → Cube BI
        </h3>

        <p class="project-meta">
          API • ETL/ELT • AWS • Sage BI
        </p>

        <p>
          Automatisation et fiabilisation des flux achats pour alimenter
          un cube BI destiné au pilotage métier et à l’analyse fournisseurs.
        </p>

      </div>

    </section>

    <!-- CONTACT -->
    <section id="contact">

      <h2>Contact</h2>

      <div class="card">

        <p>
          <b>Email :</b> aimechristophedossa@gmail.com
        </p>

        <div class="contact-links">

          <a href="https://www.linkedin.com/in/aime-christophe-dossa/"
             target="_blank">
            🔗 LinkedIn
          </a>

          <a href="https://github.com/pharno1"
             target="_blank">
            💻 GitHub
          </a>

          <a href="./DOSSA_Christophe_Data_Analyst.pdf"
             target="_blank">
            📄 CV PDF
          </a>

        </div>

        <p class="muted" style="margin-top:16px;">
          Disponible pour un poste Data Analyst / BI orienté
          reporting, performance et automatisation.
        </p>

      </div>

    </section>

  </main>

  <footer>
    © 2026 Christophe DOSSA • Portfolio Data Analyst
  </footer>

</body>
</html>
