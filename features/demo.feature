@demo
Feature: As a user
  Leo want to search books
  so leo need to use google

  Scenario Outline:leo use google search
    Given 'Leo' open the '<site_name>' site
    When  'Leo' typed '<book_name>'
    Then  'Leo' should see '<text>' on the result page
  Examples:
    | site_name      | book_name            | text                                                                                              |
    | www.baidu.com | metaprogramming ruby | Let's start learning Ruby Metaprogramming! Please refer our accompanying study notes and examples |
