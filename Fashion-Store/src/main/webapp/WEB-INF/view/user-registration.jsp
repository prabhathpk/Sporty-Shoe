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
          <div class="col-md-12 mb-0"> <strong class="text-black">User Registration</strong></div>
        </div>
      </div>
    </div>  

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h2 class="h3 mb-3 text-black">User Registration</h2>
            
          </div>
          <div class="col-md-7">
			
          <sf:form action="${pageContext.request.contextPath}/signUp" modelAttribute="form"
						method="post">
						<sf:hidden path="id" />
            
           
              <div class="p-3 p-lg-5 border">
              
               <b><%@include file="businessMessage.jsp"%></b>
             
               
               
                <div class="form-group row">
                <s:bind path="firstName">
                  <div class="col-md-6">
                    <label for="c_fname" class="text-black">First Name <span class="text-danger">*</span></label>
                    <sf:input  path="${status.expression}"
									placeholder="Enter First Name" class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
                  </div>
                  </s:bind>
                  <s:bind path="lastName">
                  <div class="col-md-6">
                    <label for="c_lname" class="text-black">Last Name <span class="text-danger">*</span></label>
                    <sf:input path="${status.expression}"
									placeholder="Enter Last Name" class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
                  </div>
                  </s:bind>
                </div>
                 <s:bind path="login">
                <div class="form-group row">
									<div class="col-md-12">
										<label for="c_email" class="text-black">Login Id <span
											class="text-danger">*</span></label>
										<sf:input path="${status.expression}"
											placeholder="Enter Login" class="form-control" />
										<font color="red"><sf:errors
												path="${status.expression}" /></font>
									</div>
								</div>
                </s:bind>
                
                <div class="form-group row">
                <s:bind path="password">
                  <div class="col-md-6">
                    <label for="c_subject" class="text-black">Password<span class="text-danger">*</span></label>
                    <sf:input type="password" path="${status.expression}"
									placeholder="Enter Password" class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
                  </div>
              	</s:bind>
                
             	 <s:bind path="confirmPassword">
                  <div class="col-md-6">
                    <label for="c_subject" class="text-black">Confirm Password<span class="text-danger">*</span></label>
                    <sf:input type="password" path="${status.expression}"
									placeholder="Enter ConfirmPassword" class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
                  </div>
               	</s:bind>
                </div>
               
                 <s:bind path="dob">
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_email" class="text-black">Date Of Birth<span class="text-danger">*</span></label>
                    <sf:input  path="${status.expression}"
									placeholder="Enter Dob" class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
                  </div>
                </div>
               </s:bind>
                
					
				<s:bind path="gender">	
                 <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_email" class="text-black">Gender<span class="text-danger">*</span></label>
                  <sf:select class="form-control" path="${status.expression}">
									<sf:option value="" label="Select" />
									<sf:options items="${genderMap}" />
								</sf:select>
								<font color="red"><sf:errors path="${status.expression}" /></font>
                  </div>
                </div>
                </s:bind>
                  <s:bind path="mobileNo">
                 <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_email" class="text-black">Mobile No<span class="text-danger">*</span></label>
                   <sf:input  path="${status.expression}"
									placeholder="Enter Mobile No" class="form-control" />
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
</body>
</html>