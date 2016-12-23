class Router {
  constructor(node) {
    this.node = node;
  }

  start() {
    this.render();

    document.addEventListener("hashchange", () => {
      this.render();
    });
  }

  activeRoute() {
    return window.location.hash.substr(1);
  }

  render() {
    this.node.innerHTML = "";
    const currentRoute = this.activeRoute();
    const p = document.createElement("p");
    p.innerHTML = currentRoute;
    this.node.appendChild(p);
  }
}

module.exports = Router;
