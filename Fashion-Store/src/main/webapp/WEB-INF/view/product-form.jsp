<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@page isELIgnored="false"%>
<div class="site-wrap">
<%@ include file="header.jsp" %>
 <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"> <strong class="text-black">Add Product</strong></div>
        </div>
      </div>
    </div>  

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h2 class="h3 mb-3 text-black">Add Product</h2>
            
          </div>
          <div class="col-md-7">
			
          <sf:form action="${pageContext.request.contextPath}/prod" modelAttribute="form"
						method="post" enctype="multipart/form-data">
						<sf:hidden path="id" />
            
           
              <div class="p-3 p-lg-5 border">
              
               <b><%@include file="businessMessage.jsp"%></b>
             
               
               <s:bind path="categoryId">
                <div class="form-group row">
									<div class="col-md-12">
										<label for="c_email" class="text-black">Category Name<span
											class="text-danger">*</span></label>
										<sf:select class="form-control" path="${status.expression}">
									<sf:option value="-1" label="Select" />
									<sf:options itemLabel="name" itemValue="id" items="${catList}" />
								</sf:select>
								<font color="red"><sf:errors path="${status.expression}" /></font>
									</div>
								</div>
                </s:bind>
               
                 
                 <s:bind path="name">
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_email" class="text-black">Name<span class="text-danger">*</span></label>
                    <sf:input  path="${status.expression}"
									placeholder="Enter Name" class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
                  </div>
                </div>
               </s:bind>
               
               
                 <s:bind path="price">
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_email" class="text-black">Price<span class="text-danger">*</span></label>
                    <sf:input  path="${status.expression}"
									placeholder="Enter Price" class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
                  </div>
                </div>
               </s:bind>
                
					
			
                  <s:bind path="description">
                 <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_email" class="text-black">Description<span class="text-danger">*</span></label>
                   <sf:textarea rows="3"  cols="5" path="${status.expression}"
									placeholder="Enter Description" class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
                  </div>
                </div>
                </s:bind>
               
               
               <s:bind path="image">
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_email" class="text-black">Image<span class="text-danger">*</span></label>
                    <sf:input type="file"  path="${status.expression}"
									placeholder="Enter Image" class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
                  </div>
                </div>
               </s:bind>

                
                <div class="form-group row">
                  <div class="col-lg-6">
                    <input type="submit" class="btn btn-primary btn-lg btn-block" name="operation" value="Save">
                  </div>
                  <div class="col-lg-6">
                    <input type="submit" class="btn btn-primary btn-lg btn-block" name="operation" value="Reset">
                  </div>
                </div>
              </div>
            </sf:form>
          </div>
 </div>
      </div>
    </div>

<%@ include file="footer.jsp" %>
</div>
