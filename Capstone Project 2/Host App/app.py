import gradio as gr
import joblib
import re

# =========================
# LOAD MODEL FILES
# =========================
model = joblib.load("model.pkl")
vectorizer = joblib.load("tfidf.pkl")

# =========================
# PREPROCESS FUNCTION
# =========================
def preprocess(text):
    text = text.lower()
    text = re.sub(r"[^a-zA-Z]", " ", text)
    return text

# =========================
# PREDICTION FUNCTION
# =========================
def predict_job(description):
    processed = preprocess(description)
    transformed = vectorizer.transform([processed])
    result = model.predict(transformed)[0]

    if result == 1:
        return "🚨 Fake Job Posting"
    else:
        return "✅ Real Job Posting"

# =========================
# GRADIO INTERFACE
# =========================
interface = gr.Interface(
    fn=predict_job,
    inputs=gr.Textbox(lines=6, placeholder="Paste job description here..."),
    outputs="text",
    title="Fake Job Detection System",
    description="Detect whether a job posting is real or fake using Machine Learning"
)

# =========================
# RUN APP
# =========================
if __name__ == "__main__":
    interface.launch()
