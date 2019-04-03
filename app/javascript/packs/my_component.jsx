const math = require("../src/math");

const React = require("react");

const ReactDOM = require("react-dom");

class MyComponent extends React.Component{
	state = {message: "This"}
		
	handleClick = (e) => {
		e.preventDefault();
		this.setState({message: "That"});
	}

	render(){
		return (
			<div>
				{this.state.message}
				<a href="#" onClick={this.handleClick} >
					Click me
				</a>
			</div>
			);
	}
}



document.addEventListener("DOMContentLoaded", function(){
	const element = document.getElementById("my-component-mount-point");
	ReactDOM.render(<MyComponent />, element);
});