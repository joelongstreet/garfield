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

window.Character = Character;