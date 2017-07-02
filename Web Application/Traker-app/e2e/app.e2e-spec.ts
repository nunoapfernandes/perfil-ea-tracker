import { TrakerAppPage } from './app.po';

describe('traker-app App', () => {
  let page: TrakerAppPage;

  beforeEach(() => {
    page = new TrakerAppPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!!');
  });
});
