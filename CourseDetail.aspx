<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseDetail.aspx.cs" Inherits="Elearning.CourseDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
         <div>
            <h2>Select a Course</h2>
            <div class="form-group">
                <label for="DropDownListMasterCourse">Maste Course:</label>
                <asp:DropDownList ID="DropDownListMasterCourse" runat="server" CssClass="form-control">
                  <%--  <asp:ListItem>--Select a Course or Master Course--</asp:ListItem>--%>
                    <asp:ListItem>Web Development Masterclass</asp:ListItem>
                    <asp:ListItem>Data Science and AI Mastery</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Button ID="ButtonFetch" runat="server" Text="Fetch Courses" CssClass="btn btn-primary" OnClick="ButtonFetch_Click" />
            </div>
            <div class="row mt-4">
                <asp:Repeater ID="RepeaterCourses" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4">
                            <div class="card mb-4 shadow-sm">
                                <img class="card-img-top" src='<%# Eval("pic") %>' alt="Card image cap" width="100" height="150">

                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("CourseName") %></h5>
                                    <p class="card-text"><%# Eval("Description") %></p>
                                    <p class="card-text"><strong>Price:</strong> $<%# Eval("Price") %></p>
                                    <a href="#" class="btn btn-primary">Add to Cart</a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
             <div>
        <%--<h4>Master Course</h4>--%>
        <asp:Repeater ID="RepeaterMasterCourse" runat="server">
            <ItemTemplate>
                <div class="card" style="width: 18rem; margin: 10px;">
                    <img class="card-img-top" src='<%# Eval("pic") %>' alt="Card image cap" width="100" height="150">
                    <div class="card-body">
                          
                        <h5 class="card-title"><%# Eval("MasterCourseName") %></h5>
                        <p class="card-text">
                            <strong>Courses:</strong> <%# Eval("CourseNames") %><br />
                            <strong>Descriptions:</strong> <%# Eval("Descriptions") %><br />
                            <strong>Total Price:</strong> $<%# Eval("TotalPrice") %>
                        </p>
                         <a href="#" class="btn btn-primary">Add to Cart</a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
        </div>


    </form>
   <%-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>--%>

</body>
</html>
