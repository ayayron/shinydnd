var tour = new Tour({
  steps: [
  {
    element: "#div2",
    title: "Title of my step",
    content: "Content of my step"
  },
  {
    element: "#div3",
    title: "Title of my step",
    content: "Content of my step"
  }
]});

// Initialize the tour
tour.init();

// Start the tour
tour.start();
