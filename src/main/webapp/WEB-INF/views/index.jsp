<html>
<head>
<%@include file="./common.jsp"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
	<div class="container mt-3">
		<div class="row">
			<div class="col-md-12">
				<h1 class="text-center">Welcome To SPRINGSTORE</h1>
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">SR.NO.</th>
							<th scope="col">Product Name</th>
							<th scope="col">Description</th>
							<th scope="col">Price</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${products }" var="p">
							<tr>
								<th scope="row">${p.pid }</th>
								<td>${p.name }</td>
								<td>${p.description }</td>
								<td class="font-weight-bold">&#8377 ${p.price }</td>
								<td>
									<a href="delete/${p.pid }"><i class="fas fa-trash-alt text-danger"></i></a>
									<a href="update/${p.pid }" style="margin-left:20px"><i class="fas fa-pen"></i></i></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="container text-center">
					<a href="add" class="btn btn-outline-success">ADD
						PRODUCT</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
