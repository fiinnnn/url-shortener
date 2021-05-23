import React from "react";
import {ClippyIcon} from "@primer/octicons-react"

export const RequestError = ({errors}) => (
  <div className="mt-2 bg-red-500 text-bold rounded-md px-4 py-2" role="alert">
    {
      Object.keys(errors).map((key) => {
        return <p><strong>{key}</strong> {errors[key]}</p>
      })
    }
  </div>
);

export class RequestSuccess extends React.Component {
  copyToClipboard = () => {
    const field = this.urlField;
    field.select();
    document.execCommand("copy");
  }

  render() {
    return (
      <div className="mt-2">
        <h2>Shortened URL:</h2>
        <div className="flex relative">
          <input
            ref={(field) => this.urlField = field}
            value={window.location.href + "r/" + this.props.shortenedUrl}
            readonly=""
            className="rounded-l-md w-full py-2 px-4 bg-gray-200 border border-gray-400"
          />

          <button onClick={this.copyToClipboard} className="cursor-pointer rounded-r-md inline-flex items-center px-3 bg-gray-200 border-t border-r border-b border-gray-400 hover:bg-gray-400">
            <ClippyIcon />
          </button>
        </div>
      </div>
    );
  }
}
