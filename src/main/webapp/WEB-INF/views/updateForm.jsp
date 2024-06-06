<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="./common.jsp"%>
</head>
<body>
	<div class="container mt-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h1 class="text-center mb-3">Edit Product Details</h1>
				
				<form action="${pageContext.request.contextPath }/handleProduct" method="post">
				<input type="hidden" value="${product.pid }" name="pid"/>
					<div class="form-group">
						<label for="name">Product Name</label>
						<input type="text" class="form-control" id="name" name="name" placeholder="Enter Product Name" value="${product.name }"/>
					</div>
					
					<div class="form-group">
						<label for="description">Product Description</label>
						<textarea class="form-control" id="description" name="description" placeholder="Enter Product Description" rows="5" >${product.description }</textarea>
					</div>
					
					<div class="form-group">
						<label for="price">Product Price</label>
						<input type="text" class="form-control" id="price" name="price" placeholder="Enter Product Price" value="${product.price }" />
					</div>
					
					<div class="container text-center">
						<a href="${pageContext.request.contextPath }/" class="btn btn-outline-success">Back</a>
						<button type="submit" class="btn btn-danger">Update</button>
					</div>
					
				</form>
			</div>
		</div>
	</div>
</body>
</html>