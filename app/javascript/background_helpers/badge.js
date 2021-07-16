export class Badge {
  static set_background_images(badges) {
    badges.forEach(badge => {
      if (badge.dataset.background) {
        badge.style.backgroundImage = "url('" + badge.dataset.background + "')"
      }
    })
  }
}
