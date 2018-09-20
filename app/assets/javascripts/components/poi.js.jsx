var Poi = React.createClass({

  getInitialState(){
    return {
      data: {},
      errors: {},
      poi: {
        latitude: '',
        longitude: '',
        category: 'coffee'
      },
    }
  },

  handleLatitudeChange(e){
    var newPoi =  this.state.poi
    newPoi.latitude = e.target.value
    this.setState({poi: newPoi});
  },

  handleLongitudeChange(e){
    var newPoi =  this.state.poi
    newPoi.longitude = e.target.value
    this.setState({poi: newPoi});
  },

  handleSelectChange(e){
    var newPoi =  this.state.poi
    newPoi.category = e.target.value
    this.setState({poi: newPoi});
  },

  handleRequestPoi(e){
      $.ajax({
        method: 'POST',
        data: {
          poi: this.state.poi,
        },
        url: '/stores/data',
        success: (res)=> {
          this.setState({ data: res, errors: {} });
        },
        error: (res) =>{
          this.setState({ errors: res.responseJSON.errors });
        }
    });
  },

  render() {
      var location = this.state.data
      data = Object.keys(location).map((key, index)=>{
        return (
        <NameByPostcode  postcode_key={key} key={index}  name={location[key]}  />
        )
      });
      console.log(Object.constructor === Array);
      if (!(Object.keys(location).length === 0) ) {
        markup = (
        <table>
          <thead>
            <tr>
              <th>Postcode</th>
              <th>Name</th>
            </tr>
          </thead>
          <tbody>
            {data}
          </tbody>
          </table>
        );
      }
    else{
      markup = '';
    }
    return(
      <div>
        <h1>Mapbox: Poi Categories</h1>
        <table>
          <thead>
            <tr>
              <th>Latitude</th>
              <th>Longitude</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <input type="text" value={this.state.poi.latitude} onChange={this.handleLatitudeChange} /><br />
                <span style={{color: 'red'}}>{this.state.errors.latitude}</span>
              </td>
              <td>
                <input type="text" value={this.state.poi.longitude} onChange={this.handleLongitudeChange} /><br />
                <span style={{color: 'red'}}>{this.state.errors.longitude}</span>
              </td>
              <td>
                <select value={this.state.poi.category} onChange={this.handleSelectChange} >
                  <option value='coffee'>Cofee</option>
                  <option value='gallery'>Gallery</option>
                  <option value='bakery'>Bakery</option>
                  <option value='cinema'>Cinema</option>
                  <option value='music'>Music</option>
                  <option value='school'>School</option>
                  <option value='bank'>Bank</option>
                  <option value='historic'>Historic</option>
                  <option value='park'>Park</option>
                  <option value='shop'>Shop</option>
                  <option value='bar'>Bar</option>
                  <option value='concert'>Concert</option>
                  <option value='hotel'>Hotel</option>
                  <option value='pizza'>Pizza</option>
                  <option value='tea'>Tea</option>
                  <option value='cafe'>Cafe</option>
                  <option value='fast food'>Fast Food</option>
                  <option value='landmark'>Landmark</option>
                  <option value='restaurant'>Restaurant</option>
                  <option value='theater'>Theater</option>
                  <option value='church'>Church</option>
                  <option value='gallery'>Finance</option>
                  <option value='finance'>Museum</option>
                  <option value='retail'>Retail</option>
                  <option value='university'>University</option>
                </select>
              </td>
              <td><button onClick={this.handleRequestPoi}>Request</button></td>
            </tr>
          </tbody>
        </table>
          {markup}
      </div>
    );
  }
});
