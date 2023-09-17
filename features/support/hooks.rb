require_relative '../page_object/pages/page_load'

Before do |scenario|
    @tags = scenario.source_tag_names
    loadBrowser
    set_browser_resolution_to_maximize
    @page=Page.new(@tags)
end

After do |scenario|
    # take_screenshot(scenario) if scenario.failed?
    sleep 5
    Capybara.current_session.driver.quit
end

# InstallPlugin do |config|
#     $tags_run = config.tag_expressions
# end
