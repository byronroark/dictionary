require 'test_helper'
class DefinitionsControllerTest < ActionController::TestCase
  setup do
    @definition = create(:definition)
    @user = create(:user)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:definitions)
  end

  test "should get new" do
    sign_in :user, @user
    get :new
    assert_response :success
  end

  test "should create definition" do
    sign_in :user, @user

    # Make a new definition but do NOT put in the database
    # because the post will do that below. We make a new one
    # that is different than the factory we create above (e.g. @definition)
    brand_new_definition = build(:definition)

    assert_difference('Definition.count') do
      post :create, definition: { meaning: brand_new_definition.meaning, word: brand_new_definition.word }
    end

    # redirect_to @definition

    # assigns(:definition) is the same as @definition in the controller
    # definition_path(...) => /definitions/7
    # finally assert that we were redirected to that URL
    assert_redirected_to assigns(:definition)
  end

  test "should show definition" do
    get :show, id: @definition
    assert_response :success
  end

  test "should get edit" do
    sign_in :user, @user

    get :edit, id: @definition
    assert_response :success
  end

  test "should update definition" do
    sign_in :user, @user

    patch :update, id: @definition, definition: { meaning: @definition.meaning, word: @definition.word }
    assert_redirected_to definition_path(assigns(:definition))
  end

  test "should destroy definition" do
    sign_in :user, @user

    assert_difference('Definition.count', -1) do
      delete :destroy, id: @definition
    end

    assert_redirected_to definitions_path
  end

  test "should get search" do
    get :search

    assert_response :success

    assert_not_nil assigns(:definitions)
  end

  test "search finds the correct word" do
    # Hit the search request
    get :search

    definition_1 = create(:definition)
    definition_2 = create(:definition)
    definition_3 = create(:definition)
    definition_4 = create(:definition)

    # Search for the word  definition_3.word

    # See if the assigns has the defintion that matches (definition_3)
    assert_equal definition_3, assigns(:definitions)
  end

  test "search finds the correct meaning" do
    get :search


  end
end
