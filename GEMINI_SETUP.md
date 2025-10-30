# 🤖 Setting Up Gemini AI for Enhanced Query Processing

The Agricultural Market Intelligence System now supports Google Gemini AI for advanced natural language query processing!

## 🌟 Features

With Gemini AI enabled, you can:
- Ask **any question** about agricultural data in natural language
- Get **intelligent, contextual answers** based on real data
- Compare crops, districts, prices, and weather patterns
- Receive detailed agricultural recommendations
- Ask complex analytical questions

## 📋 Setup Instructions

### Step 1: Get Your Gemini API Key

1. Go to [Google AI Studio](https://makersuite.google.com/app/apikey)
2. Sign in with your Google account
3. Click **"Get API Key"** or **"Create API Key"**
4. Copy your API key

### Step 2: Configure Environment Variables

1. Open the `.env` file in the `project` folder
2. Replace the placeholder with your actual API key:

```env
VITE_GEMINI_API_KEY=your-actual-api-key-here
```

### Step 3: Restart the Development Server

Stop the current server (Ctrl+C) and restart it:

```bash
npm run dev
```

## ✅ How to Verify It's Working

1. Open the application in your browser
2. Look for the **"AI Powered"** badge with a sparkle icon next to "Ask About Agricultural Data"
3. Check the browser console - you should see: `🤖 Gemini AI enabled`

## 💡 Example Questions You Can Ask

With Gemini AI enabled, you can ask virtually any agricultural question:

### Basic Queries
- "What is the price of rice?"
- "Which crop has the highest yield?"
- "What's the weather in Thanjavur?"

### Comparative Analysis
- "Compare rice yields across all districts"
- "Which districts have the best weather for farming?"
- "What are the differences between cotton cultivation in Coimbatore and Erode?"

### Recommendations
- "What crops should I grow in Madurai?"
- "What is the most profitable crop in Tamil Nadu?"
- "Recommend crops for semi-arid climate"

### Complex Questions
- "Tell me about turmeric cultivation in Tamil Nadu"
- "Which crops require less water but give good yields?"
- "What factors affect crop yields in different districts?"
- "Analyze market trends for cash crops"

## 🔄 Fallback Mode

If Gemini API is not configured, the system automatically falls back to **pattern-based query processing**, which still works well for common questions but with limited flexibility.

You'll see this message in the console:
```
💡 Using pattern-based query processing (set VITE_GEMINI_API_KEY in .env for AI-powered responses)
```

## 🎯 Benefits of AI-Powered Queries

| Feature | Without Gemini | With Gemini AI |
|---------|---------------|----------------|
| Question Types | Predefined patterns only | Any natural language question |
| Answer Quality | Template-based | Contextual & intelligent |
| Data Analysis | Basic | Advanced comparisons |
| Understanding | Keyword matching | Natural language understanding |
| Flexibility | Limited | Unlimited |

## 🔐 API Key Security

- Your API key is stored locally in the `.env` file
- It's **never** committed to version control (`.env` is in `.gitignore`)
- The key is only used client-side for API calls to Google
- Keep your API key private and don't share it

## 🆓 Gemini API Pricing

- Google Gemini offers a **generous free tier**
- Free tier includes: 60 requests per minute
- Perfect for development and demonstration
- Check [Google AI Pricing](https://ai.google.dev/pricing) for current limits

## 🐛 Troubleshooting

### "AI Powered" badge not showing
- Check that your API key is correctly set in `.env`
- Make sure the key doesn't contain spaces or quotes
- Restart the development server after adding the key

### API errors in console
- Verify your API key is valid at [Google AI Studio](https://makersuite.google.com/app/apikey)
- Check if you've exceeded rate limits (60 requests/minute on free tier)
- Ensure you have internet connectivity

### Queries not working
- The system automatically falls back to pattern-based processing if Gemini fails
- Check browser console for specific error messages
- Try refreshing the page

## 📚 Learn More

- [Google Gemini Documentation](https://ai.google.dev/docs)
- [Gemini API Reference](https://ai.google.dev/api)
- [Best Practices for Prompting](https://ai.google.dev/docs/prompt_best_practices)

---

**Happy Farming! 🌾🚜**

