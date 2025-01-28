function verify() {

    event.preventDefault(); // Prevent form submission

    
    let pass = document.getElementById('pass').value;
    let email = document.getElementById('email').value;

    if (pass == "mindset" && email == "sankey901@solutions.com") {
        console.log("Login successfull2");
        window.location.href = "welcome.html"
    }
    else if (pass != "mindset") {
        window.alert("Wrong Password");
    }
    else if (email != "sankey901@solutions.com") {
        window.alert("Wrong Email");
    } else {
        window.alert("Unexpected error occurs");
    }
}