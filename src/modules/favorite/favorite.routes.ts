import { Hono } from "hono";
import type { AppEnv } from "../../middleware/auth.middleware";
import { customerAuth } from "../../middleware/auth.middleware";
import { favoriteController } from "./favorite.controller";

const favoriteRoutes = new Hono<AppEnv>();

favoriteRoutes.get("/favorites", customerAuth, favoriteController.list);
favoriteRoutes.post("/favorites/organizers/:id", customerAuth, favoriteController.followOrganizer);
favoriteRoutes.delete("/favorites/organizers/:id", customerAuth, favoriteController.unfollowOrganizer);
favoriteRoutes.post("/favorites/artists/:id", customerAuth, favoriteController.followArtist);
favoriteRoutes.delete("/favorites/artists/:id", customerAuth, favoriteController.unfollowArtist);

export default favoriteRoutes;