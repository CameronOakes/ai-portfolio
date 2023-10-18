import { Controller } from "@hotwired/stimulus"
require('dotenv').config();

// Connects to data-controller="api-fetch"
export default class extends Controller {
  static targets = ["check"]

  connect() {
    console.log("is this working")
    console.log(this.checkTarget)
    this.fetchData();
  }

  async fetchData() {
    // const apiKey = process.env.AI_OR_NOT

    const requestOptions = {
      method: "POST",
      headers: {
        "x-api-key": apiKey,
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        object: "https://images.unsplash.com/photo-1684369585053-2b35888b3ae8?auto=format&fit=crop&q=80&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&w=1928",
      })
    }
    try {
      const response = await fetch("https://v3-atrium-prod-api.optic.xyz/aion/ai-generated/reports", requestOptions); // Replace with your API URL
      const data = await response.json();
      this.checkTarget.innerHTML = JSON.stringify(data, null, 2);
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  }
}
