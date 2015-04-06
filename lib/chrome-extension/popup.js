// JS run in the Chrome extension
var send_response;

function cancelButtonClick() {
  // Cancel the form submit
  event.preventDefault();
  
  // Close popup window
  window.close();
}

function submitButtonClick() {
  // Cancel the form submit
  event.preventDefault();

  var typo_text = document.getElementById("typo-text").value;
  if(!!typo_text) {
    sendDataToServer(send_response);
    changeToSuccessUI();
  }
  else {
    document.querySelector('#typo-text').classList.toggle('warning');
  }
}

// Provide feedback to the user that the submission was successful
function changeToSuccessUI() {
  document.querySelector('#input-screen').classList.toggle('invisible');
  document.querySelector('#success-screen').classList.toggle('invisible');
}

function sendDataToServer(send_response) {
  console.log("Structuring Data...")
  var typo_data = {
    typo: {
      url: send_response['url'],
      domain_text: send_response['domain'],
      highlighted_text: send_response['text'],
      complete_text: send_response['complete_text'],
      user_email: document.getElementById("email-text").value,
      comments: document.getElementById("comment-text").value
    }
  }
  console.log(typo_data);
  
  console.log("Sending Data...")
  $.ajax({
    type: "POST",
    url: "http://typo-blaster.herokuapp.com/typos/create",
    data: typo_data
    // success: success,
    // dataType: json
  });
}

  function populateHighlightedText() {
    chrome.tabs.query({active: true, currentWindow: true}, function(tabs) {

      //Sends message to the page.js and gets highlights text
      console.log("Sending message to tab...");
      chrome.tabs.sendMessage(tabs[0].id, {}, function(response) {
        console.log("Received message from tab...");
        send_response = response;
        console.log(response);
        document.getElementById("typo-text").innerHTML = response.text;

      });
    });
  }

// When the popup HTML has loaded
window.addEventListener('load', function(evt) {
  // Set click event listeners on the buttons
  document.getElementById("main-form").addEventListener('submit', function(){return false;});
  document.getElementById("cancel-button").addEventListener('click', cancelButtonClick);
  document.getElementById("submit-button").addEventListener('click', submitButtonClick);

  populateHighlightedText()

});
