

$(document).ready(function () {

    $('#Edit_btn').click(function () {

        $("#profile-detail").toggle();
        $("#profile_edit").toggle();
//        
        var currentText = $(this).text();
        if (currentText == "Edit") {
            $(this).text("Back")
        } else {
            $(this).text("Edit");
        }

    });
});

//Add Post using Ajax

$(document).ready(function () {
    $("#add_post_form").on("submit", function (event) {
//        jyare form submit thase tyare function call thase...
        console.log("you have clicked on submit button");
        event.preventDefault(); // file Asyncronize banave

        let form = new FormData(this); // aa form na badha j data collect karse..

//      have server ne request karee using Ajax..
        $.ajax({
            url: 'AddPostServlet', // ama data moklavana chhe ane pachho respone aavse..
            type: 'POST', // Post type ma jase
            data: form, // form variable na badha j data chhe.
//            if request successfully come so run 
            success: function (data, textStatus, jqXHR) {
                if (data.trim() === 'done') {
//                    swal("Good job!", "Advertise Successully Added.", "success")
//                    window.location("profile.jsp");
                    swal("Advertise Successully Added.")
                            .then((value) => {
//                                $("#add_post_form")[0].reset();
                                window.location.href = 'profile.jsp';
                            });
                } else {
                    swal("Error!!", "Something went wrong...try again.", "error")
                }
                console.log(data)
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Error in Ajax ");
                swal("Error!!", "Something went wrong...try again.", "error")
            },
            processData: false,
            contentType: false


        })

    })
})


// load post using Ajax

function getPost(catId, temp) {
    $(".c-link").removeClass('active')
    $.ajax({
        url: "load_post.jsp",
        data: {cid: catId},
        success: function (data, textStatus, jqXHR) {
            console.log(data)
            $("#post_container").html(data)
            $(temp).addClass('active');

        }
    })
}

$(document).ready(function (event) {

    let allPostRef = $('.c-link')[0];
    getPost(0, allPostRef) // if catId==0 then fetch all posts
    // if catId>0 fetch all post of catId


});

