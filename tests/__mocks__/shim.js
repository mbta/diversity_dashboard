global.requestAnimationFrame = (callback) => {
  setTimeout(callback, 0);
};

global.dashboardData = { name: "A name" };
