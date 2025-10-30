# Knowledge-Graph-based-Agricultural-Market-Intelligence-System
Knowledge Graph–based Agricultural Market Intelligence System

🌾 Agricultural Market Intelligent System
Intelligent Agricultural Data Visualization and Query Platform for Tamil Nadu

The Agricultural Market Intelligent System (AMIS) is a web-based platform that visualizes and analyzes agricultural data such as crop yield, market prices, and weather insights across districts of Tamil Nadu.
It integrates AI-powered query processing and interactive visualizations to help farmers, policymakers, and researchers make data-driven decisions.

🚀 Features

🌾 AI-powered natural language query interface using Gemini AI

🧠 Rule-based fallback for offline or low-connectivity conditions

🌐 Interactive Knowledge Graph visualization with D3.js

📊 District-wise analysis of crops, yield, weather, and prices

🔗 Real-time data management with Supabase backend

💬 Responsive React interface with TailwindCSS styling

🏗️ Architecture Overview (Simplified)
┌────────────────────────────┐
│  🌐 Presentation Layer     │
│  React + TypeScript + D3   │
│  • Query Interface         │
│  • Knowledge Graph         │
│  • District Analysis View  │
└────────────┬───────────────┘
             │
┌────────────▼───────────────┐
│  ⚙️ Application Layer      │
│  Gemini AI + Rule Engine   │
│  • Query Processing        │
│  • Response Shaping        │
│  • Data Fetch Orchestration│
└────────────┬───────────────┘
             │
┌────────────▼───────────────┐
│  🗄️ Data Layer             │
│  Supabase (PostgreSQL)     │
│  • Crops, Districts, Prices│
│  • Weather & Recommendations│
└────────────────────────────┘

🧰 Tech Stack
Category	Technologies
Frontend	React, TypeScript, TailwindCSS
AI	Google Gemini API
Visualization	D3.js
Backend (BaaS)	Supabase (PostgreSQL + Auth + API)
Build Tool	Vite
Deployment	Vercel
⚙️ Installation
1️⃣ Clone the Repository
git clone https://github.com/<your-username>/agricultural-market-intelligent-system.git
cd agricultural-market-intelligent-system

2️⃣ Install Dependencies
npm install

3️⃣ Configure Environment Variables

Create a .env file in the root directory:

VITE_SUPABASE_URL=https://your-supabase-url.supabase.co
VITE_SUPABASE_ANON_KEY=your-supabase-anon-key
VITE_GEMINI_API_KEY=your-gemini-api-key

▶️ Run the App
Development
npm run dev


Then open http://localhost:5173

Production Build
npm run build
npm run preview
