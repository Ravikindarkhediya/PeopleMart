<%@page  import="com.Class.*"%>
<%@page  import="com.dao.*"%>
<%@page  import="com.servlet.*"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page  errorPage="error_page.jsp"%> 


<%
    PostDao dao = new PostDao(ConnectionProvider.getConnection());
    
  
    List<Post> postList = null;
    int cid = Integer.parseInt(request.getParameter("cid")); // aya je cid chhe te ajax thi aave chhe : getPost()
    
    if(cid==0){
          postList= dao.getAllPost(); // all post get
    }else{
        postList = dao.getPostByCatId(cid); // category wise get all post
    }
    
    if(postList.size()==0){
        out.println("<h2 class='text-align display-3'>No Post in this Category.</h2>");
    }
    
    ArrayList<Category> catList = dao.getAllCategory();

    for (Post p : postList) {
        Category category = dao.getSpecificCategory(p.getPid());
        
%>

<div class="col-md-6 col-lg-4 col-xl-3">

    <div class="card " style="width: 17rem; height: 25rem;">
        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
             style="top: 10px; left: 10px;"><%= category != null ? category.getName() : "No Category" %></div>
        <img src="Post_imgs/<%= p.getpImag() %>" class="card-img-top img-fluid rounded-top post-img" alt="">
        <div class="card-body">

            <h5 class="card-title"><%= p.getpTitle() %></h5>
            <p class="card-text"><%= p.getpContent() %></p>
            <strong><i class="fa fa-rupee">.</i><%= p.getpPrice() %></strong>
        </div>
        <div class="card-footer">
            <a href="#" data-post-id="<%= p.getPid() %>" data-bs-toggle="modal"  
               data-bs-target="#show_more_post_modal" class="show_more_btn btn border border-secondary rounded text-primary mx-2 ">
                Show more...
            </a>
            <button onclick="doLike(<%= p.getPid() %>)"  class="btn border border-secondary rounded text-primary ">
                <i class="fa fa-thumbs-o-up"></i><span>10</span>
            </button>
        </div>
    </div>
</div>
<%
}
%>

<script>

    // show more button click to get postid using Ajax
    $(document).ready(function () {
        $('.show_more_btn').on('click', function (event) {
            var postId = $(this).data('post-id');
            console.log('Post ID:', postId);
            event.preventDefault();
            $.ajax({
                url: 'show_more_page.jsp',
                type: 'POST',
                data: {
                    post_id: postId
                },
                success: function (response) {
                    console.log('Response:', response);
                    $('#modal-body-content').html(response);

                },
                error: function (xhr, status, error) {
                    console.error('AJAX Error:', status, error);
                }
            });
        });
    });



</script>

<!--Show more Post modal-->

<div class="modal fade" id="show_more_post_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Post Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="modal-body-content">

                <!-- Post details will be loaded here via AJAX -->

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        // JavaScript Function
        function doLike(postId) {
            $.ajax({
                url: 'GetCurrentUserServlet',
                type: 'GET',
                dataType: 'json',
                success: function (user) {
                    if (user && user.id) { // If user is logged in
                        console.log('Liking Post ID:', postId);
                        console.log('User ID:', user.id);

                        // Proceed with liking the post
                        $.ajax({
                            url: 'LikeServlet', // Your servlet to handle the like functionality
                            type: 'POST',
                            data: {postId: postId, userId: user.id},
                            success: function (response) {
                                // Handle the success response, maybe update like count
                                console.log('Post liked successfully');
                            },
                            error: function (xhr, status, error) {
                                console.error('Error liking post:', status, error);
                            }
                        });
                    } else {
                        alert('You need to log in to like a post.');
                        window.location.href = 'login.jsp';
                    }
                },
                error: function (xhr, status, error) {
                    console.error('Error checking user session:', status, error);
                }
            });
        }
