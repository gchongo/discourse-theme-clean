import { apiInitializer } from "discourse/lib/api";

export default apiInitializer((api) => {
  api.modifyClass("component:d-navigation", {
    pluginId: "discourse-theme-clean-always-show-drafts-menu",

    set draftCount(value) {
      this._cleanThemeDraftCount = value;
    },

    get draftCount() {
      return Math.max(this._cleanThemeDraftCount ?? 0, 1);
    },
  });
});
