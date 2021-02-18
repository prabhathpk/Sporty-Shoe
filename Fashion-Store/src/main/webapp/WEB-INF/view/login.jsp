<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<div class="site-wrap">
	<%@ include file="header.jsp"%>
	<div class="bg-light py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-12 mb-0">
					<strong class="text-black">Login</strong>
				</div>
			</div>
		</div>
	</div>

	<div class="site-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2 class="h3 mb-3 text-black">Login</h2>

				</div>
				<div class="col-md-7">
					<sf:form action="/Fashion-Store/login" modelAttribute="form"
						method="post">

						<div class="p-3 p-lg-5 border">

							<b><%@ include file="businessMessage.jsp"%></b>

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
							<s:bind path="password">
							<div class="form-group row">
								<div class="col-md-12">
									<label for="c_subject" class="text-black">Password<span
										class="text-danger">*</span></label> <sf:input type="password" path="${status.expression}"
									placeholder="Enter Password" class="form-control" />
								<font color="red"><sf:errors path="${status.expression}" /></font>
								</div>
							</div>
							</s:bind>
							<div class="form-group row">
								<div class="col-lg-6">
									<input type="submit" class="btn btn-primary btn-lg btn-block"
										name="operation" value="SignIn">
								</div>
								<div class="col-lg-6">
									<input type="submit" class="btn btn-primary btn-lg btn-block"
										name="operation" value="SignUp">
								</div>
							</div>

						</div>
					</sf:form>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</div>
