/*
    CODE FOR SIGNUP PAGE
*/

function registerOnSubmit() {
    let user = $("#user").val();
    let uni = $("#uni").val();
    let fname = $("#fname").val();
    let lname = $("#lname").val();
    let pass = $("#pass").val();
    let confirm = $("#confirm").val();
    let responses = [user, uni, fname, lname, pass, confirm];

    for(var i=0; i<responses.length; i++) {
        if(pass != confirm) {
            alert("Passwords don't match.");
            break;
        }

        if(responses[i] == "") {
            alert("Please complete all fields.");
            break;
        } else {
            submitSignUpData(responses);
            alert("Account succesfully created!");
            window.location.href = "index.html"
            break;
        }
    }
}

// Put data into database
function submitSignUpData(responses) {
    // enter code here
}

/* 
    CODE FOR GRADE ENTRY PAGE
*/

function submitGradeEntryData() {
    let school = $("#school").val();
    let year = $("#year").val();
    let term = $("#term").val();
    let major = $("#major").val();
    let cumGpa = $("#cumGpa").val();
    let termGpa = $("#termGpa").val();
    let course = $("#course").val();
    let grade = $("#grade").val();
    let required = [school, year, term, major, cumGpa, termGpa];
    // let fullGrades = required.push(course, grade);
    console.log(required);
    console.log(fullGrades);
}

