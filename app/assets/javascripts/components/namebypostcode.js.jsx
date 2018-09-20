var NameByPostcode = React.createClass({

  render() {
    return(
        <tr>
        <td>
          {this.props.postcode_key}
        </td>
        <td>
         {this.props.name.join(", ")}
        </td>
        <td>
          {this.props.category}
        </td>
      </tr>
    );
  }
});
