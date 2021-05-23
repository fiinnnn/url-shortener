import React from "react";
import axios from "axios";

import {RequestError, RequestSuccess} from "./request_info";

class App extends React.Component {

  constructor(props) {
    super(props);

    this.state = {
      target: "",
      source: "",
      errors: null,
      shortenedUrl: ""
    }

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChangeTarget = (e) => this.setState({ target: e.target.value });
  handleChangeSource = (e) => this.setState({ source: e.target.value });

  handleSubmit(e) {
    e.preventDefault();

    this.setState({ errors: null });

    axios
      .post('/links', { link: { target: this.state.target, source: this.state.source } })
      .then((response) => {
        this.setState({ shortenedUrl: response.data.source });
      })
      .catch((error) => {
        this.setState({ errors: error.response.data.errors });
      });
  }

  render() {
    let requestResult;
    if (this.state.errors) {
      requestResult = <RequestError errors={this.state.errors} />;
    } else if (this.state.shortenedUrl) {
      requestResult = <RequestSuccess shortenedUrl={this.state.shortenedUrl} />;
    }

    return (
      <div className="content bg-gradient-to-b from-blue-400 to-blue-900">
        <div className="card">
          <h2 className="card-header">
            URL Shortener
          </h2>

          <form onSubmit={this.handleSubmit} className="mt-8 space-y-6" >
              <input type="text" value={this.state.target} onChange={this.handleChangeTarget} placeholder="Enter a target URL" className="form-input rounded-md" />

              <div className="flex relative">
                <span className="rounded-l-md relative block px-1 py-2 border border-gray-400 bg-gray-300">{window.location.href+"r/"}</span>
                <input type="text" value={this.state.source} onChange={this.handleChangeSource} placeholder="Custom source name (optional)" className="form-input rounded-r-md" />
              </div>

              <input type="submit" value="Shorten" className="btn btn-primary" />
          </form>

          {requestResult}
        </div>
      </div>
    );
  }
}

export default App
