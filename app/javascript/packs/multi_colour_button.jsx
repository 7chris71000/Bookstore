const math = require("../src/math");

const React = require("react");

const ReactDOM = require("react-dom");

class MultiColourButton extends React.Component{
	state = {linkColourClass: "red-bg"}
		
	handleClick = (e) => {
		e.preventDefault();
		if(this.state.linkColourClass == "red-bg"){
			this.setState({linkColourClass:"blue-bg"});
		} else if(this.state.linkColourClass == "blue-bg"){
			this.setState({linkColourClass:"green-bg"});
		} else {
			this.setState({linkColourClass:"red-bg"});
		}
	}

	render(){
		const { label, sublabel } = this.props;
		const { linkColourClass } = this.state;
		return (
			<a href="#" onClick={ this.handleClick } className={ linkColourClass }>
				<div>
				  {label}
			  </div>
			  <div>
				  {sublabel}
			  </div>
			</a>
			);
	}
}



document.addEventListener("DOMContentLoaded", function(){
	const element = document.getElementById("my-component-mount-point");
	ReactDOM.render(<MultiColourButton label="My Button" sublabel="My Sublabel" />, element);
});