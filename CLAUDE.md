# CLAUDE.md

Guide pour Claude Code (et tout contributeur) travaillant sur **SixSence**, une plateforme de compétition avec matchmaking, mode Ranked et classement.

## Structure du dépôt

```
backend/    API Express (Node.js, CommonJS) — déployée sur Render
frontend/   Site Next.js (Pages Router) + Tailwind CSS — déployé sur Vercel
database/   Schéma SQL et notes sur les tables (Supabase / PostgreSQL)
```

## Commandes

Backend (`backend/`) :

```bash
npm install
npm run dev     # nodemon server.js (port 3001 par défaut, ou $PORT)
npm start       # node server.js
```

Frontend (`frontend/`) :

```bash
npm install
npm run dev     # http://localhost:3000
npm run build
```

Il n'y a pas encore de tests automatisés ni de linter configuré.

## Backend

- Point d'entrée : `backend/server.js` (CORS, cookies, montage des routes).
- Organisation dans `backend/src/` : `routes/` → `controllers/` → `models/`, avec la logique métier dans `services/` (file d'attente, matchmaker, timer global, système de rang) et des utilitaires dans `utils/` (client Supabase, logger, temps, carte aléatoire).
- Authentification via Discord OAuth (`/auth/discord`, `/auth/discord/callback`), puis JWT ; `/me` renvoie l'utilisateur connecté.
- Autres routes : `/leaderboard/top10`, `/queue/join`, `/queue/leave`, `/queue/status`, `/queue/list`.
- Les origines CORS autorisées sont codées en dur dans `server.js` (sixsence.fr, sixsence.vercel.app) : à mettre à jour si un nouveau domaine est ajouté.

### Variables d'environnement

Le backend lit `backend/.env` via `dotenv`. Clés attendues :
`DISCORD_CLIENT_ID`, `DISCORD_CLIENT_SECRET`, `DISCORD_REDIRECT_URI`, `SUPABASE_URL`, `SUPABASE_KEY`, `SESSION_SECRET`, `JWT_SECRET`, `FRONTEND_URL`, `BACKEND_URL`.

Ne jamais committer de valeurs secrètes.

## Frontend

- Pages dans `frontend/src/pages/` (`index`, `accueil`, `queue`, `ranked`, `profile`, `auth/callback`).
- Composants dans `frontend/src/components/` : la plupart existent en deux versions, desktop (`Xxx.tsx`) et mobile (`XxxMobile.tsx`). Une modification visuelle doit généralement être faite dans les deux.
- L'URL de l'API backend (`https://sixsence-backend.onrender.com`) est codée en dur dans de nombreux fichiers (pages, composants, `utils/auth.js`, `hooks/useUser.js`). Pour la changer, chercher `sixsence-backend.onrender.com` dans `frontend/src/`.
- Le jeton de session est stocké dans `localStorage` sous la clé `session`.
- Images et icônes statiques dans `frontend/public/assets/` et `frontend/public/images/`.

## Conventions

- Code et commentaires en français.
- Ne pas committer `node_modules/` ni les fichiers `.env`.
