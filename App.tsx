import { useState } from 'react';
import { BarChart3, Map } from 'lucide-react';
import KnowledgeGraph from './components/KnowledgeGraph';
import QueryInterface from './components/QueryInterface';
import DistrictAnalysis from './components/DistrictAnalysis';

function App() {
  const [activeTab, setActiveTab] = useState<'graph' | 'districts'>('graph');

  return (
    <div className="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100">
      <header className="bg-white shadow-sm border-b border-gray-200">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-3xl font-bold text-gray-900">
                Agricultural Market Intelligent System
              </h1>
              <p className="text-gray-600 mt-1">
                Tamil Nadu Agricultural Data Analytics Platform
              </p>
            </div>
            <div className="flex gap-2">
              <button
                onClick={() => setActiveTab('graph')}
                className={`flex items-center gap-2 px-4 py-2 rounded-lg font-medium transition-colors ${
                  activeTab === 'graph'
                    ? 'bg-blue-500 text-white'
                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                }`}
              >
                <BarChart3 className="w-5 h-5" />
                Knowledge Graph
              </button>
              <button
                onClick={() => setActiveTab('districts')}
                className={`flex items-center gap-2 px-4 py-2 rounded-lg font-medium transition-colors ${
                  activeTab === 'districts'
                    ? 'bg-blue-500 text-white'
                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                }`}
              >
                <Map className="w-5 h-5" />
                District Analysis
              </button>
            </div>
          </div>
        </div>
      </header>

      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {activeTab === 'graph' ? (
          <div className="space-y-6">
            <KnowledgeGraph />
            <QueryInterface />
          </div>
        ) : (
          <DistrictAnalysis />
        )}
      </main>

      <footer className="bg-white border-t border-gray-200 mt-12">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
          <p className="text-center text-sm text-gray-600">
            Agricultural Market Intelligent System - Powered by Real-time Data Analytics
          </p>
        </div>
      </footer>
    </div>
  );
}

export default App;
