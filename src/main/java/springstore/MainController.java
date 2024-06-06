package springstore;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import springstore.dao.ProductDao;
import springstore.model.Product;

@Controller
public class MainController {

	@Autowired
	private ProductDao pd;

	@RequestMapping("/")
	public String home(Model model) {
		List<Product> products = pd.getProducts();
		model.addAttribute("products",products);
		return "index";
	}

	// showing product form
	@RequestMapping("add")
	public String addProduct(Model model) {
		model.addAttribute("title", "SPRINGSTORE || ADD PRODUCT");
		return "addForm";
	}

	// handling form data
	@RequestMapping(value = "/handleProduct", method = RequestMethod.POST)
	public RedirectView handleProduct(@ModelAttribute("product") Product product, HttpServletRequest request) {
		System.out.println(product);
		pd.createProduct(product);
		RedirectView rv = new RedirectView();
		rv.setUrl(request.getContextPath() + "/");
		return rv;
	}
	
	// delete controller
	@RequestMapping("/delete/{productId}")
	public RedirectView deleteProduct(@PathVariable("productId") int productId,HttpServletRequest request) {
		this.pd.deleteProduct(productId);
		return new RedirectView(request.getContextPath() + "/");
	}
	
	
	// updating 
	@RequestMapping("update/{productId}")
	public String updateProduct(@PathVariable("productId") int productId, Model model) {
		Product p = this.pd.getProduct(productId);
		model.addAttribute("product",p);
		return "updateForm";
	}
}
