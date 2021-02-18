<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@page isELIgnored="false"%>
<div class="site-wrap">
	<%@ include file="header.jsp"%>
	<div class="bg-light py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-12 mb-0">
					<strong class="text-black">${prod.name}</strong>
				</div>
			</div>
		</div>
	</div>
	<sf:form action="/Fashion-Store/bookProd" method="post"
		modelAttribute="form">
		<div class="site-section">
			<div class="container">


				<div class="row">
					<div class="col-md-6">
						<img
							src="/Fashion-Store/prod/getImage/<c:out value='${prod.id}'/>"
							alt="Image" class="img-fluid">
					</div>
					<div class="col-md-6">
						<h2 class="text-black">${prod.name}</h2>
						<p>${prod.description}</p>
						<p>
							<strong class="text-primary h4">${prod.price}Rs</strong>
						</p>
						<%-- <s:bind path="pSize">
							<div class="mb-1 d-flex">
								<label for="option-sm" class="d-flex mr-3 mb-3"> <span
									class="d-inline-block mr-2"
									style="top: -2px; position: relative;"><input
										type="radio" name="${status.expression}" value="Small"></span>
									<span class="d-inline-block text-black">Small</span>
								</label> <label for="option-md" class="d-flex mr-3 mb-3"> <span
									class="d-inline-block mr-2"
									style="top: -2px; position: relative;"><input
										type="radio" name="${status.expression}" value="Medium"></span>
									<span class="d-inline-block text-black">Medium</span>
								</label> <label for="option-lg" class="d-flex mr-3 mb-3"> <span
									class="d-inline-block mr-2"
									style="top: -2px; position: relative;"><input
										type="radio" name="${status.expression}" value="Large"></span>
									<span class="d-inline-block text-black">Large</span>
								</label> <label for="option-xl" class="d-flex mr-3 mb-3"> <span
									class="d-inline-block mr-2"
									style="top: -2px; position: relative;"><input
										type="radio" name="${status.expression}" value="Extra Large"></span>
									<span class="d-inline-block text-black"> Extra Large</span>
								</label>
							</div>
						</s:bind> --%>
						<%-- <div class="mb-5">
							<div class="input-group mb-3" style="max-width: 120px;">
								<div class="input-group-prepend">
									<button class="btn btn-outline-primary js-btn-minus"
										type="button">&minus;</button>
								</div>
								<s:bind path="quantity">
								<sf:input  cssClass="form-control text-center"
									path="${status.expression}" value="1" 
									aria-label="Example text with button addon"
									aria-describedby="button-addon1"/>
								</s:bind>	
								<div class="input-group-append">
									<button class="btn btn-outline-primary js-btn-plus"
										type="button">&plus;</button>
								</div>
							</div>

						</div> --%>
						<p>
							<a href="/Fashion-Store/cart?pId=${prod.id}&operation=addCart"
								class="buy-now btn btn-sm btn-primary">Add To Cart</a>
						</p>
					</div>

				</div>


				<%-- <div class="row">
					<div class="col-md-12">
						<h2 class="h3 mb-3 text-black">Fill And Book</h2>

					</div>
					<div class="col-md-7">




						<div class="p-3 p-lg-5 border">

							<s:bind path="name">
								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_email" class="text-black">Name<span
											class="text-danger">*</span></label>
										<sf:input path="${status.expression}" placeholder="Enter Name"
											class="form-control" />
										<font color="red"><sf:errors
												path="${status.expression}" /></font>
									</div>
								</div>
							</s:bind>

							<s:bind path="emailId">
								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_email" class="text-black">Email Id<span
											class="text-danger">*</span></label>
										<sf:input path="${status.expression}" placeholder="Enter Email Id"
											class="form-control" />
										<font color="red"><sf:errors
												path="${status.expression}" /></font>
									</div>
								</div>
							</s:bind>
														
							<s:bind path="mobileNo">
								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_email" class="text-black">Mobile No<span
											class="text-danger">*</span></label>
										<sf:input path="${status.expression}" placeholder="Enter MobileNo"
											class="form-control" />
										<font color="red"><sf:errors
												path="${status.expression}" /></font>
									</div>
								</div>
							</s:bind>
							
							<s:bind path="country">
								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_email" class="text-black">Country<span
											class="text-danger">*</span></label>
										<sf:input path="${status.expression}" placeholder="Enter MobileNo"
											class="form-control" />
										<font color="red"><sf:errors
												path="${status.expression}" /></font>
									</div>
								</div>
							</s:bind>							

							<s:bind path="state">
								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_email" class="text-black">State<span
											class="text-danger">*</span></label>
										<sf:input path="${status.expression}" placeholder="Enter State"
											class="form-control" />
										<font color="red"><sf:errors
												path="${status.expression}" /></font>
									</div>
								</div>
							</s:bind>
							
							<s:bind path="district">
								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_email" class="text-black">District<span
											class="text-danger">*</span></label>
										<sf:input path="${status.expression}" placeholder="Enter District"
											class="form-control" />
										<font color="red"><sf:errors
												path="${status.expression}" /></font>
									</div>
								</div>
							</s:bind>
							
							<s:bind path="pinCode">
								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_email" class="text-black">PinCode<span
											class="text-danger">*</span></label>
										<sf:input path="${status.expression}" placeholder="Enter PinCode"
											class="form-control" />
										<font color="red"><sf:errors
												path="${status.expression}" /></font>
									</div>
								</div>
							</s:bind>
							
							<s:bind path="address">
								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_email" class="text-black">Address<span
											class="text-danger">*</span></label>
										<sf:textarea cols="30" rows="4" path="${status.expression}" placeholder="Enter Address"
											class="form-control" />
										<font color="red"><sf:errors
												path="${status.expression}" /></font>
									</div>
								</div>
							</s:bind>
							
							


							<div class="form-group row">
								<div class="col-lg-6">
									<input type="submit" class="btn btn-primary btn-lg btn-block"
										name="operation" value="Payment">
								</div>
								<div class="col-lg-6">
									<input type="submit" class="btn btn-primary btn-lg btn-block"
										name="operation" value="Cancel">
								</div>
							</div>
						</div> --%>

					<!-- </div> -->

				</div>

			</div>
		</div>
	</sf:form>


	<div style="margin-top: 20px">
		<%@ include file="footer.jsp"%>
	</div>
</div>