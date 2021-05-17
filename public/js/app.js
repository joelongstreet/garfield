class App extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      pizzasCreated: 0,
      pizzasSearchValues: [],
      peopleSearchValues: [],
    }

    this.onPizzaCreation = this.onPizzaCreation.bind(this);
    this.onPizzaSearch = this.onPizzaSearch.bind(this);
    this.onPizzaDelete = this.onPizzaDelete.bind(this);
    this.onPeopleSearch = this.onPeopleSearch.bind(this);
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

  onPizzaDelete(id) {
    window.HttpService.deletePizza(id).then((res) => {
      const pizzas = this.state.pizzasSearchValues.filter(p => p.id != id)
      this.setState({ pizzasSearchValues: pizzas });
    });
  }

  onPeopleSearch(inputValue) {
    window.HttpService.findPeopleByName(inputValue).then((res) => {
      res.json().then((people) => {
        this.setState({ peopleSearchValues: people });
      });
    });
  }

  render() {
    return (
      <div className='grid gap-8 grid-cols-3'>
        <Character
          pizzasCreated={this.state.pizzasCreated}
        />
        <div className='col-span-2'>
          <h1 className='text-5xl mb-4 text-green-500 p-4 bg-gradient-to-b from-indigo-100 to-white mb-12'>Garfield Pizza Machine</h1>
          <ButtonInput
            onSubmit={this.onPizzaCreation}
            label='Create Pizza'
            placeholder='Anchovy'
            buttonTitle='Create'
          />
          <hr className='mb-12' />
          <ButtonInput
            onSubmit={this.onPizzaSearch}
            label='Find pizza by type'
            placeholder='Pepperoni'
            buttonTitle='Search'
          />
          <List
            data={this.state.pizzasSearchValues}
            onDelete={this.onPizzaDelete}
            displayKey='type'
          />
          <hr className='mb-12' />
          <ButtonInput
            onSubmit={this.onPeopleSearch}
            label='Find people by name'
            placeholder='Jon Arbuckle'
            buttonTitle='Search'
          />
          <List
            data={this.state.peopleSearchValues}
            displayKey='name'
          />
        </div>
      </div>
    )
  }
}

ReactDOM.render(
  <App />,
  document.getElementById('root')
);