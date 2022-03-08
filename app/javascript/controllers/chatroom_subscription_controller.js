import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages", "form"]

  connect() {
    const messages = this.messagesTarget;
    const currentUserId = messages.dataset.currentUserId;
    if (messages) {
      const chatroomId = messages.dataset.chatroomId;
      const currentUserId = messages.dataset.currentUserId;

      this.channel = consumer.subscriptions.create(
        { channel: "ChatroomChannel", id: chatroomId  },
        { received(messageHTML) {
          // update the DOM
          stimulusController.insertIntoDOM(messageHTML, currentUserId, messages);
          }
        })
    }
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  insertIntoDOM = (messageHTML, currentUserId, messages) => {
    // create an empty div
    const message = document.createElement('div') // https://developer.mozilla.org/pt-BR/docs/Web/API/Document/createElement

    // put the message HTML inside
    message.innerHTML = messageHTML;
    // if the message is from the sender,
    if (message.firstChild.dataset.senderId === currentUserId) {
      // add the sender CSS
      message.firstChild.classList.add('sent-message');
    } else {
      // Else, add the receiver css
      message.firstChild.classList.add('received-message');
    }
    messages.scrollTo(0, messages.scrollHeight)
    this.formTarget.reset()

    // insert the element in the DOM
    messages.insertAdjacentElement('beforeend', message);
  }
}
