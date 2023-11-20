import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="api-fetch"
export default class extends Controller {
  static targets = ["check"]
  static values = {
    key: String
  }

  connect() {
    console.log("is this working")
    console.log(this.checkTarget)
    console.log(this.keyValue)
  }

  async fetchData() {
    function percentageFormatter(num) {
      return new Intl.NumberFormat('default', {
        style: 'percent',
        minimumFractionDigits: 2,
        maximumFractionDigits: 2,
      }).format(num);
    }
    // const apiKey = `${process.env.AI_OR_NOT}`;
    const apiKey = ''
    const requestOptions = {
      method: "POST",
      headers: {
        "x-api-key": apiKey,
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        object: `https://res.cloudinary.com/dll73yhjm/image/upload/c_fill,h_300,w_400/${this.keyValue}`,
      })
    }
    try {
      const response = await fetch("https://prod.ai-or-not.com/aion/ai-generated/reports", requestOptions);
      const data = await response.json();
      console.log(data)
      if (data.report.ai.is_detected === true) {
        this.checkTarget.innerHTML = `AI Detected with ${percentageFormatter(data.report.ai.confidence)} accuracy`
      } else if (data.report.human.is_detected === true) {
        this.checkTarget.innerHTML = `Human made with ${percentageFormatter(data.report.ai.confidence)} accuracy`
      } else {
        this.checkTarget.innerHTML = 'Data inconclusive'
      }

      // this.checkTarget.innerHTML = JSON.stringify(data, null, 2);
      // console.log(typeof JSON.stringify(data, null, 2))

    } catch (error) {
      console.error("Error fetching data:", error);
    }
  }
}
