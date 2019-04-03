$(document).ready(function(){
  console.log("Test");
  // if($("body").hasClass('.book-index')){
  if($('body').find('div.book-index').length != 0){
    

    //write function that takes in callback and executes that callback

    // function callCallbackFunc(text, callback){
    //   callback(text);
    // }

    // callCallbackFunc("Alert Message", function(alertText) {
    //   alert(alertText);
    // });

    loadBooksLink = document.getElementById("load-books-link");

    var loadBooksIntoDom = function(books){
        // Delete load books link
        loadBooksLink.remove();

        var ulOfBooks = document.getElementById("ul-of-books");

        ulOfBooks.innerHTML = "";

        for(var i = 0; i < books.length; i++){

          console.log(books[i]);

          // create the list element to append all information about book
          var liOfBooks = document.createElement("li");
          liOfBooks.className = "one-fourth";
          ulOfBooks.appendChild(liOfBooks);

          // add book image and view book link
          var imageDiv = document.createElement("div");
          imageDiv.className = "book-cover-container";
          liOfBooks.appendChild(imageDiv);

          const src = '<%= asset_path "no_image_found.jpg" %>';

          var bookCoverImg = document.createElement("img");
          bookCoverImg.src = src;
          bookCoverImg.height = "238";
          bookCoverImg.width = "160";
          imageDiv.appendChild(bookCoverImg);

          var bookCoverButton = document.createElement("a");
          bookCoverButton.className = "view-details";
          bookCoverButton.href = "/books/" + books[i].id;
          var bookText = document.createTextNode("View Details");
          bookCoverButton.appendChild(bookText);
          imageDiv.appendChild(bookCoverButton);

          // add title to each book
          var bookTitleH4 = document.createElement("h4");
          bookTitleH4.className = "book-author";
          var titleLink = document.createElement("a");
          titleLink.href = "/books/" + books[i].id;
          var bookTitle = document.createTextNode(books[i].title);
          titleLink.appendChild(bookTitle);
          bookTitleH4.appendChild(titleLink);
          liOfBooks.appendChild(bookTitleH4);

          // add author
          var bookTitleH4 = document.createElement("p");
          bookTitleH4.className = "book-author";
          var bookTitle = document.createTextNode(books[i].user ? books[i].user.name : "");
          bookTitleH4.appendChild(bookTitle);
          liOfBooks.appendChild(bookTitleH4);
        }

      };

      var fetchBooks = function(){
       $.ajax({
        url: "/books",
        method: "GET",
        data: {
          format: "json"
        }, 
        success: loadBooksIntoDom

      });

     };

     loadBooksLink.addEventListener("click", function(event){
      event.preventDefault();
      console.log("TEST");

      fetchBooks();
    });
   } else if($('body').find('div.checkout-index').length != 0) {
    console.log("checkoutIndex");
      //create variables to addEventListener to
      var givenName = document.getElementById("first-name");
      var familyName = document.getElementById("last-name");
      var postal = document.getElementById("postal");
      var email = document.getElementById("email");
      var submitForm = document.getElementById("submitFormHidden");
      var pageDiv = document.getElementById("checkout-form");

      var submitElement = document.createElement("button");
      submitElement.id = "submitFormCreate";
      var submitText = document.createTextNode("Submit");
      submitElement.appendChild(submitText);

      //regex expression that accepts a-z A-Z and spaces
      var nameRegex = /^[a-zA-Z ]+$/;
      //regex expression that that works MOST of the time. 
      //Since there is no perfect way to validate email other than user accepting validation email this will do for now.
      var emailRegex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      //regex expression that accepts a code in the form of XYXYXY where X is a letter and Y is a single digit integer
      var postalRegex = /^[a-zA-Z][0-9][a-zA-Z][ -]?[0-9][a-zA-Z][0-9]$/;

      givenName.addEventListener("keyup", function () {
        if(nameRegex.test(givenName.value)){
          givenName.className = "field-success";
        } else {
          givenName.className = "";
        }

        if (
          givenName.className == "field-success" &&
          familyName.className == "field-success" &&
          postal.className == "field-success" &&
          email.className == "field-success"
          ){
          submitForm.className = ""; //Unhide
          document.getElementById("buttonDiv").appendChild(submitElement); //Create

        } else {
          submitForm.className = "hidden-submit"; //Unhide
          submitElement.remove(); //Create
        }
      });
      familyName.addEventListener("keyup", function () {
        if(nameRegex.test(familyName.value)){
          familyName.className = "field-success";
        } else {
          familyName.className = "";
        }

        if (
          givenName.className == "field-success" &&
          familyName.className == "field-success" &&
          postal.className == "field-success" &&
          email.className == "field-success"
          ){
          submitForm.className = ""; //Unhide
          document.getElementById("buttonDiv").appendChild(submitElement); //Create

        } else {
          submitForm.className = "hidden-submit"; //Unhide
          submitElement.remove(); //Create
        }
      });
      postal.addEventListener("keyup", function () {
        if(postalRegex.test(postal.value)){
          postal.className = "field-success";
        } else {
          postal.className = "";
        }

        if (
          givenName.className == "field-success" &&
          familyName.className == "field-success" &&
          postal.className == "field-success" &&
          email.className == "field-success"
          ){
          submitForm.className = ""; //Unhide
          document.getElementById("buttonDiv").appendChild(submitElement); //Create

        } else {
          submitForm.className = "hidden-submit"; //Unhide
          submitElement.remove(); //Create
        }
      });
      email.addEventListener("keyup", function () {
        if(emailRegex.test(email.value)){
          email.className = "field-success";
        } else {
          email.className = "";
        }

        if (
          givenName.className == "field-success" &&
          familyName.className == "field-success" &&
          postal.className == "field-success" &&
          email.className == "field-success"
          ){
          submitForm.className = ""; //Unhide
          document.getElementById("buttonDiv").appendChild(submitElement); //Create

        } else {
          submitForm.className = "hidden-submit"; //Unhide
          submitElement.remove(); //Create
        }
      });

      //Unhide
      submitForm.addEventListener("click", function(){
        pageDiv.remove();

        var thankYouElement = document.createElement("b");
        var thankYouMessage = document.createTextNode("Thank you for your purchase.");
        thankYouElement.appendChild(thankYouMessage);
        document.getElementById("containerId").appendChild(thankYouElement);
      });

      //Create
      submitElement.addEventListener("click", function(){
        pageDiv.remove();

        var thankYouElement = document.createElement("b");
        var thankYouMessage = document.createTextNode("Thank you for your purchase.");
        thankYouElement.appendChild(thankYouMessage);
        document.getElementById("containerId").appendChild(thankYouElement);
      });

    } else if ($('body').find('div.page-home').length != 0) {
      var buttonElement = document.getElementById("my-link");
      console.log(buttonElement);

      var changeMessage = function(event){
        event.preventDefault();
        console.log("Change message called");
      };

      buttonElement.addEventListener("click", changeMessage);
    }
  });