class App extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      pizzasCreated: 0,
      pizzasSearchValues: [],
    }

    this.onPizzaCreation = this.onPizzaCreation.bind(this);
    this.onPizzaSearch = this.onPizzaSearch.bind(this);
  }

  onPizzaCreation(inputValue) {
    window.HttpService.createPizza(inputValue).then(() => {
      this.setState((state) => ({
        pizzasCreated: state.pizzasCreated + 1
      }));
    });
  }

  onPizzaSearch(inputValue) {
    window.HttpService.findPizzasByType(inputValue).then((res) => {
      res.json().then((pizzas) => {
        this.setState({ pizzasSearchValues: pizzas });
      });
    });
  }

  render() {
    return (
      <div className='grid grid-cols-3'>
        <Character
          pizzasCreated={this.state.pizzasCreated}
        />
        <div className='col-span-2'>
          <h1 className='text-5xl mb-4 text-green-500 p-4 bg-gradient-to-b from-indigo-100 to-white'>Garfield Pizza Machine</h1>
          <ButtonInput
            onSubmit={this.onPizzaCreation}
            label='Create Pizza'
            placeholder='Anchovy'
            buttonTitle='Create'
          />
          <hr className='mb-4' />
          <ButtonInput
            onSubmit={this.onPizzaSearch}
            label='Find pizza by type'
            placeholder='Pepperoni'
            buttonTitle='Search'
          />
          <List
            data={this.state.pizzasSearchValues}
            displayKey='type'
          />
        </div>
      </div>
    )
  }
}

class Character extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <img
          src='/img/pizza.jpeg'
          key={this.props.pizzasCreated}
          className='w-24 h-24 rounded border-4 rounded-full border-indigo-700 p-2 shadow mx-auto fade-up opacity-0 mt-8'
          style={{transition: '.5s linear'}}
        />
        <img src='/img/garfield.jpeg' />;
      </div>
    )
  }
}

class List extends React.Component {
  render() {
    const listItems = this.props.data.map((d) =>
      <li
        className='border-t border-gray-100 p-2 text-gray-700'
        key={d.id}
      >
        <span className='mr-1'>{d.id}:</span>
        {d[this.props.displayKey]}
      </li>
    );
    return (
      <ul>{listItems}</ul>
    )
  }
}

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

ReactDOM.render(
  <App />,
  document.getElementById('root')
);