import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = { result: 0, num1: "", num2: ""};
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }

  //your code here

  setNum1(event) {
    event.preventDefault();
    if (event.currentTarget.value === "") {
      this.setState({num1: ""});
    } else {
      const num1 = parseInt(event.currentTarget.value);
      this.setState({num1: num1});
    }
  }

  setNum2(event) {
    event.preventDefault();
    if (event.currentTarget.value === "") {
      this.setState({num2: ""});
    } else {
      const num2 = parseInt(event.currentTarget.value);
      this.setState({num2: num2});
    }
  }

  add(event) {
    event.preventDefault();
    this.setState({result: this.state.num1 + this.state.num2});
  }
  subtract(event) {
    event.preventDefault();
    this.setState({result: this.state.num1 - this.state.num2});
  }

  multiply(event) {
    event.preventDefault();
    this.setState({result: this.state.num1 * this.state.num2});
  }

  divide(event) {
    event.preventDefault();
    this.setState({result: this.state.num1 / this.state.num2});
  }

  clear(event) {
    event.preventDefault();
    this.setState({result: 0, num1: "", num2: ""});
  }


  render(){
    const { num1, num2 } = { num1: num1, num2: num2 };

    return (
      <div>
        <h1>{this.state.result}</h1>
        <input onChange={this.setNum1} value={num1}></input>
        <input onChange={this.setNum2} value={num2}></input>
        <br />
        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>/</button>
        <button onClick={this.clear}>Clear</button>
      </div>
    );
  }

}
export default Calculator;
