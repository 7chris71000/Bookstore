const React = require("react");

const ReactDOM = require("react-dom");

class BooksForm extends React.Component{

	state = {title: "", publishedYear: "", imageUrl: ""};

	handleInputChange = (e) => {
		const name = e.target.name;
		this.setState({[name]: e.target.value});
	}


	submitForm = (e) => {
		const {title, publishedYear: published_year, imageUrl: image_url} = this.state;
		e.preventDefault();
		$.ajax({
			url: "/books",
			method: "post",
			data: {
				book: {
					title,
					published_year,
					image_url
				}
			},
			success: () => {
				alert("Success");
			}
		});
	}

	render() {
		const {title, publishedYear, imageUrl} = this.state;
		return (
			<div>
				<h2>Books Form</h2>
				<div className="field">
					<input type="text" onChange={this.handleInputChange} value={title} name="title" />
				</div>
				<div className="field">
					<input type="text" onChange={this.handleInputChange} value={publishedYear} name="publishedYear" />
				</div>
				<div className="field">
					<input type="text" onChange={this.handleInputChange} value={imageUrl} name="imageUrl" />
				</div>
				<a href="#" onClick={this.submitForm}>
					Submit
				</a>
			</div>
			);
	}

}

document.addEventListener("DOMContentLoaded", function(){
	const element = document.getElementById("books-form-mount-point");
	ReactDOM.render(
		<BooksForm />, 
		element
		);
});