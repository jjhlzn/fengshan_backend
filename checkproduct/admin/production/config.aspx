<%@ Page Title="" Language="C#" MasterPageFile="~/admin/production/admin.Master"  AutoEventWireup="true" CodeBehind="config.aspx.cs" Inherits="fengshan.admin.production.config" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <!--<link href="../vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet"> -->
    <!-- Select2 -->
    <link href="../vendors/select2/dist/css/select2.min.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="../vendors/switchery/dist/switchery.min.css" rel="stylesheet">
    <!-- starrr -->
    <link href="../vendors/starrr/dist/starrr.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
     <div class="">
           

            <div class="clearfix"></div>

            <div class="row">

              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><%=siteConfig.name %> <small></small></h2>
                    <div class="clearfix"></div>
                  </div>

                  <div class="x_content" style="height: 580px;">

                     <div class="row">
                          <table class="addTable" style="margin-left: 10px; margin-bottom: 5px;">
                              <tr>
                                  <td>值:</td>
                                  <td><input id="name" class="" type="text"></td>

                                  <td style="margin-left: 10px;">序号:</td>
                                  <td><input id="sequence" class="" type="text"></td>
                              
                                  <td><button  class=" searchBtn" style="margin-left: 5px;" onclick="addClick(); return false;">添加</button></td>
                              </tr>
                          </table>
                    
                    </div>
                
                    <div class="table-responsive" >
                      <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                        
                            <th class="column-title">值 </th>
                             
                            <th class="column-title">序号 </th>
                             <th class="column-title no-link last"><span class="nobr"></span></th>
                            <th class="bulk-actions" colspan="7">
                              <a class="antoo" style="color:#fff; font-weight:500;">操作  <span class="action-cnt"> </span> </a>
                            </th> 
                          </tr>
                        </thead>

                        <tbody id="tableBody">
                            
                          <% foreach (fengshan.DomainModel.ConfigItem item in siteConfig.items) { %>
                              <tr class="pointer" id="<%=item.id  %>" >
                                <td class=" "> <%=item.name %> </td>
                                   <td class=" "> <%=item.sequence %> </td>
                                <td class=" last"> <a href="#" onclick="deleteClick('<%=item.id  %>'); return false;">删除</a> 
                                </td>
                              </tr>
                          <% } %>
                         
                            
                        </tbody>
                      </table>
                    </div>
				  
						
                  </div>
                </div>
              </div>
            </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="JSPlaceHolder" runat="server">


            <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="../vendors/iCheck/icheck.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="../vendors/moment/min/moment.min.js"></script>
    <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap-wysiwyg -->
    <script src="../vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
    <script src="../vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
    <script src="../vendors/google-code-prettify/src/prettify.js"></script>
    <!-- jQuery Tags Input -->
    <script src="../vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
    <!-- Switchery -->
    <script src="../vendors/switchery/dist/switchery.min.js"></script>
    <!-- Select2 -->
    <script src="../vendors/select2/dist/js/select2.full.min.js"></script>

    <!-- Autosize -->
    <script src="../vendors/autosize/dist/autosize.min.js"></script>
    <!-- jQuery autocomplete -->
    <script src="../vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
    <!-- starrr -->
    <script src="../vendors/starrr/dist/starrr.js"></script>
    <!-- Custom Theme Scripts -->
    
     <script src="./js/lodash.js"></script>
     <script src="./js/config.js?id=2"></script>

    <script src="../build/js/custom.min.js"></script> 
</asp:Content>

