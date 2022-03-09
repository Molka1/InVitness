import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["form", "messages", "message"]

  connect() {
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageScrollDownAndResetForm(data) }
      )
      console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
    }

  #insertMessageScrollDownAndResetForm(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messageTargets.forEach((msg) => {
      const senderId = msg.dataset.senderId
      const currentUserId = this.messagesTarget.dataset.currentUserId
      if (currentUserId == senderId) {
        msg.classList.add('sent-message')
      } else {
        msg.classList.add('received-message')
      }
    })


    this.formTarget.reset()
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
