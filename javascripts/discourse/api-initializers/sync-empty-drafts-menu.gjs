import { apiInitializer } from "discourse/lib/api";
import { ajax } from "discourse/lib/ajax";

export default apiInitializer((api) => {
  const currentUser = api.getCurrentUser();

  if (!currentUser?.draft_count) {
    return;
  }

  ajax("/drafts.json?offset=0&limit=1")
    .then((result) => {
      if (Array.isArray(result?.drafts) && result.drafts.length === 0) {
        currentUser.set("draft_count", 0);
      }
    })
    .catch(() => {
      return null;
    });
});
