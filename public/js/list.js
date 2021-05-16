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

window.List = List;