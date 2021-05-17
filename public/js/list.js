class List extends React.Component {
  render() {
    const listItems = this.props.data.map((d) =>
      <li
        className='border-t border-gray-100 p-2 text-gray-700 overflow-hidden'
        key={d.id}
      >
        <span className='mr-1'>{d.id}:</span>
        {d[this.props.displayKey]}

        {this.props.onDelete instanceof Function &&
          <button
            onClick={() => this.props.onDelete(d.id)}
            className='bg-red-700 border-2 border-red-400 hover:bg-red-600 text-white rounded-lg py-0.5 px-2.5 float-right'
          >
            ×
          </button>
        }
      </li>
    );
    return (
      <ul>{listItems}</ul>
    )
  }
}

window.List = List;