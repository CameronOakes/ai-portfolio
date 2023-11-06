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
    const apiKey = process.env.AI_OR_NOT

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
      const response = await fetch("https://v3-atrium-prod-api.optic.xyz/aion/ai-generated/reports", requestOptions);
      const data = await response.json();
      this.checkTarget.innerHTML = JSON.stringify(data, null, 2);
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  }
}
