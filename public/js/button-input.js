class ButtonInput extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      inputValue: ''
    }

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    if (this.props.onSubmit) {
      this.props.onSubmit(this.state.inputValue);
    }

    this.setState({ inputValue: '' })
    e.preventDefault();
  }

  handleChange(e) {
    this.setState({ inputValue: e.target.value })
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label
          className='block mb-1 text-gray-600'
        >
          {this.props.label}
        </label>
        <div className='w-full grid grid-cols-4'>
          <TextInput
            className='mr-2 col-span-3'
            value={this.state.inputValue}
            onChange={this.handleChange}
            placeholder={this.props.placeholder}
          />
          <Button title={this.props.buttonTitle} />
        </div>
      </form>
    )
  }
}

class Button extends React.Component {
  render() {
    return (
      <button className='py-2 px-4 border-2 border-yellow-700 bg-yellow-500 rounded-xl text-white hover:bg-yellow-400 outline-none'>
        {this.props.title}
      </button>
    )
  }
}

class TextInput extends React.Component {
  render() {
    return (
      <input
        className={`p-2 border-2 border-indigo-700 rounded-xl text-indigo-700 outline-none ${this.props.className}`}
        type='text'
        onChange={this.props.onChange}
        value={this.props.value}
        placeholder={this.props.placeholder}
      />
    )
  }
}

window.ButtonInput = ButtonInput;