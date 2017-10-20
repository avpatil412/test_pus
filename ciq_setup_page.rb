class SetupPage
  include PageObject
  include YmlHelper
  include BrowserUtilities

  # Setup 1 - Agency
  text_field(:agency_number, :id => "agencyEditForm_agencyNumber")
  button(:retrieve_agency, :id => "agencyEditForm_retrieveAgency")
  select_list(:ext_agency, :id => "setupModalForm_agency")
  form(:setupform, :id => "setupModalForm")
  # Setup
  select_list(:producer_code, :id => "setupModalForm_producerCode")
  select_list(:underwriter, :id => "setupModalForm_underwriter")
  text_field(:effective_date, :name => "effectiveDate") #:id => "setupModalForm_effectiveDate")
  text_field(:expiration_date, :id => "setupModalForm_expirationDate")
  # button(:state_dropdown, :class => "multiselect dropdown-toggle btn-multiselect")
  button(:state_dropdown, :title => "None selected")
  select_list(:states, :id => "setupModalForm_states")

  text_field(:underwriterID, :id => "setupModalForm_underwriterID") # for Exclusive agent
  text_field(:effective_date2, :name => "effectiveDate")

  # Product Selection
  checkbox(:business_auto, :id => "setupModalForm_productSelection_BA")
  checkbox(:business_owners, :id => "setupModalForm_productSelection_BOP")
  checkbox(:commercial_liability, :id => "setupModalForm_productSelection_CGL")
  checkbox(:commercial_property, :id => "setupModalForm_productSelection_PROPC")
  checkbox(:commercial_umbrella, :id => "setupModalForm_productSelection_CU")
  checkbox(:workers_compensation, :id => "setupModalForm_productSelection_WC")
  button(:continue, :id => "setupModalForm_continueButton")
  button(:farm_continue, :id => "primaryButton")
  text_field(:gross_annual_inc, :id => "accountInformationForm_farmingAnnualGrossReceipts")

  # More Products(Underwriter Required)
  checkbox(:commercial_inland_marine, :id => "setupModalForm_otherProductSelection_CIM")
  checkbox(:crime, :id => "setupModalForm_otherProductSelection_CRM")
  checkbox(:auto_dealers, :id => "setupModalForm_otherProductSelection_CGAR")
  checkbox(:other_commercial_property, :id => "setupModalForm_otherProductSelection_CPNQ")
  checkbox(:other_commercial_general_liability, :id => "setupModalForm_otherProductSelection_NQGL")
  # Name Insured
  button(:addNamedInsured, :id => "namedInsuredForm_addNamedInsured")
  select_list(:entity, :id => "namedInsuredForm_entity")
  text_field(:insuredName, :id => "namedInsuredForm_insuredName")
  text_field(:dba, :id => "namedInsuredForm_dba")
  button(:save, :id => "namedInsuredForm_saveButton")

  # Address
  button(:addAddress, :id => "addressForm_addAddress")
  text_field(:address, :id => "addressTabForm_address")
  text_field(:city, :id => "addressTabForm_city")
  text_field(:zip, :id => "addressTabForm_zip")
  button(:address_save, :id => "addressForm_saveButton")

  #Address Detail
  select_list(:county, :id => "addressDetailTabForm_county")
  select_list(:municipality, :id => "addressDetailTabForm_municipality")
  select_list(:protectionClass, :name => "protectionClass")
  text_field(:fpa, :name => "fpaName")

  # Loss Information
  radio(:lossInformationForm2, :id => "lossInformationForm_lossInformationQuestion2")
  # Account Information
  radio(:applicantPriorInsurance1, :id => "accountInformationForm_applicantPriorInsurance1") # CP, CL
  radio(:applicantPriorInsurance2, :id => "accountInformationForm_applicantPriorInsurance2") # CP, CL
  radio(:policyCancelledNonRenewedThreeYears1, :id => "accountInformationForm_policyCancelledNonRenewedThreeYears1") # CP, CL
  radio(:policyCancelledNonRenewedThreeYears2, :id => "accountInformationForm_policyCancelledNonRenewedThreeYears2") # CP, CL
  radio(:accountProvideCoverage1, :id => "accountInformationForm_accountProvideCoverage1") # CP, CL
  radio(:accountProvideCoverage2, :id => "accountInformationForm_accountProvideCoverage2") # CP, CL
  radio(:employeesUsePersonalAuto1, :id => "accountInformationForm_employeesUsePersonalAuto1") # CP, CL
  radio(:employeesUsePersonalAuto2, :id => "accountInformationForm_employeesUsePersonalAuto2") # CP, CL , BA
  radio(:noticeQuestion1, :id => "accountInformationForm_noticeQuestion1") # CP, CL
  radio(:noticeQuestion2, :id => "accountInformationForm_noticeQuestion2") # CP, CL
  radio(:employeesUsePersonalAuto, :id => "accountInformationForm_employeesUsePersonalAuto2") #BA
  radio(:accountInformationFormOtherBusinessVentures2, :id => "accountInformationForm_otherBusinessVentures2") #BA
  button(:accountSetupNextButton, :id => "accountSetupForm_nextBtn")
  text_field(:businessStartedYear, :id => "creditYearBusinessStartedTextField")
  radio(:existingQuoteNumberQuestion, :id => "accountInformationForm_existingQuoteNumberQuestion2") # CL
  radio(:existingPolicyQuestion, :id => "accountInformationForm_existingPolicyQuestion2") # CL
  select_list(:transferProgramType, :id => "accountInformationForm_transferProgramType")
  text_field(:bus_yr_started, :id => "accountInformationForm_yearBusinessStarted") # testing in it3(additional text field in IT3)
  radio(:farm_app_income, :id => "accountInformationForm_farmingMainSourceIncomeAccountSetup2")
  radio(:farm_dwelling, :id => "accountInformationForm_prOwOccupiedDwelling2")
  select_list(:farm_risk_type, :id => "accountInformationForm_customerType")
  # Override information
  button(:addoverride, :id => "financialInformationForm_overrideButton")
  select_list(:vendor, :id => "financialInformationForm_overrideVendor")
  text_field(:orderdate, :id => "financialInformationForm_overrideOrderDate")
  text_field(:overriderVCID, :id => "financialInformationForm_overrideVCIDNumber")
  text_field(:override_score, :id => "financialInformationForm_overrideFinancialScore")
  checkbox(:state_item, :class => "checkbox")
  button(:order, :onclick => "orderCredit();") # ordering Financial information
  #  button(:continueOrder, :onclick => "verifyYearOfBusinessStartedForFinancialInformatioNotFoundAndCallSubmit();")
  button(:continueOrder, :text => "Continue")
  # business_owners_program
  select_list(:business_program_owners, :id => "businessownersForm_bopPrograms")

  def set_business_program_owners (business_own=nil)
    self.business_program_owners = business_own
  end

  def set_risk_type (risk_type=nil)
    self.farm_risk_type = risk_type
  end

  def gross_annual_income (gross_ann_inc=nil)
    self.gross_annual_inc = gross_ann_inc
  end

  def ciq_setup1(agency_number)
    puts "--- Retrieving Agency --- #{agency_number}"
    puts "count of windows : #{@browser.windows.count}"
    @browser.window(:index => 1).use
    sleep 5
    #wait_for_element_to_be_visible({id: "agencyEditForm_agencyNumber"})
    agency_number_element.when_present
    fail "Agency Number field is not present" unless agency_number_element.visible?
    self.agency_number = agency_number
    retrieve_agency
    sleep 2
  end

  def verify_ciq_setup2_level1
    puts "--- verifying setup 2 ----"
    fail "Producer is not present " unless producer_code_element.visible?
    fail "underwriter is not present " unless underwriter_element.visible?
    fail "effective_date is not present " unless effective_date_element.visible?
    fail "expiration date is not present " unless expiration_date_element.visible?
    fail "states dropdown is not present" unless states_element.visible?

    puts "---verifying product selection checkboxes ----"
    fail "Business Auto checkbox is not present" unless business_auto_element.visible?
    fail "BusinessOwners checkbox is not present" unless business_owners_element.visible?
    fail "Commercial Liabilty checkbox is not present" unless commercial_liability_element.visible?
    fail "Commercial Property checkbox is not preent" unless commercial_property_element.visible?
    fail "Commercial Umberella checkbox is not present" unless commercial_umbrella_element.visible?
    fail "Workers Compensation checkbox is not present" unless workers_compensation_element.visible?
    puts "--- setup2 page verified successfully ---"
  end


  def select_product(lob)
    puts "--- selecting lob ----"
    case lob
      when "BA"
        business_auto_element.check
      when "BOP"
        business_owners_element.check
      when "CL"
        commercial_liability_element.check
      when "CP"
        commercial_property_element.check
      when "CU"
        commercial_umbrella_element.check
      when "WC"
        workers_compensation_element.check
    end
  end

  def add_named_insured(state, lob)
    r = Random.new
    puts "--- setting name insured ---"
    sleep 5
    addNamedInsured
    sleep 5
    entity_element.when_present
    entity_element.select("AS")
    click_tab
    name_insured = "testing_#{r.rand(1..100)}_#{$agent_type}_#{state}_#{lob}"
    sleep 2
    self.insuredName = name_insured
    self.dba = name_insured
    save
  end

  def add_addresses
    address_data= get_addresses_by_state($state_name)
    puts "--- Setting address ---"
    sleep 5
    #wait_for_element_to_be_present({:id => "addressForm_addAddress"})
    addAddress
    sleep 2
    self.address = address_data[0]
    self.city = address_data[1]
    self.zip = address_data[2]
    address_save
    sleep 10
    fill_address_detail if @browser.text.include? "Unable to validate address"
    sleep 2
    @browser.button(:id => "primaryButton").click if @browser.button(:id => "primaryButton").present?

  end

  def fill_address_detail
    puts "--- Filling address details ---"
    sleep 5
    county_element.select("001")
    municipality_element.select("04326")
    protectionClass_element.select("01")
    self.fpa = "test"
    address_save
  end


  def fill_lossInfo_AccountInfo(lob)
    puts "--- Filling loss information and Account Information---"
    sleep 5
    self.bus_yr_started = "2016" if $channel == "nwag"
    # self.business_yr_started = bus_yr_started
    lossInformationForm2_element.set
    applicantPriorInsurance2_element.set
    policyCancelledNonRenewedThreeYears2_element.set
    accountProvideCoverage2_element.click if lob =="CP" || lob == "CL" || lob=="WC"
    employeesUsePersonalAuto2_element.click if lob =="BA" || lob == "CL"
    existingQuoteNumberQuestion_element.checked? if lob =="CL" && $agent_type == "Internal"
    farm_app_income_element.set if lob =="WC" && $channel == "nwag"
    self.gross_annual_inc = "22546" if lob =="WC" && $channel == "nwag"
    # self.gross_annual_inc = gross_ann_inc
    farm_dwelling_element.set if lob =="WC" && $channel == "nwag"
    self.farm_risk_type = "AgriChoice Plus"

    if lob =="BOP"
      employeesUsePersonalAuto2_element.set
      accountInformationFormOtherBusinessVentures2_element.set
    end

    existingPolicyQuestion_element.checked? if lob =="CL"
    transferProgramType_element.exists? if lob == "CL"
    noticeQuestion1_element.set
    accountSetupNextButton
    puts "clicked next"
    sleep 5
  end

  def financial_order
    sleep 2
    puts "--- Financial ordering ----"
    order
    sleep 5
    businessStartedYear_element.when_present
    #wait.until(businessStartedYear_element.present?, "Waiting for business started year")
    self.businessStartedYear = "2016"
    continueOrder
    sleep 2

=begin
    if not @browser.text.include? "Commercial Package"
      @browser.link(:title => "Go to Account Setup").fire_event "onclick"
      sleep 2
    end
    if addoverride_element.present?
      #puts " Financial inforation unacceptable text is not present" unless @browser.text.include? "Financial Information Unacceptable"
      puts "-- Clicking Add Override to add Financial Information ---"
      add_override
    end
=end
=begin
    if @browser.text.include? "Commercial Property Setup"
      @browser.link(:title => "Go to Account Setup").fire_event "onclick"
      sleep 2
    end
    if addoverride_element.present?
      puts " Financial inforation unacceptable text is not present" unless @browser.text.include? "Financial Information Unacceptable"
      add_override
    end
  end
=end
  end

  def add_override
    sleep 2
    puts "--- Adding override ----"
    #scroll_to_bottom
    addoverride
    sleep 2
    vendor_element.select("DB")
    self.orderdate = $date
    click_tab
    sleep 2
    self.overriderVCID = "111111111" if overriderVCID_element.visible?
    self.override_score = "850"
    click_next
    sleep 2
  end

  def call_setupmethods(state, business_own=nil, lob)
    # selecting product
    select_product(lob)
    continue
    unless $channel!="nwag" && lob=="WC"
      sleep 2
      farm_continue
    end
    unless business_own.to_s.strip.empty?
      set_business_program_owners(business_own)
    end
    # get_channel
    add_named_insured(state, lob)
    add_addresses
    fill_lossInfo_AccountInfo(lob)
    # financial_order
  end

  def ciq_setup_3(agent_type, agency_number, business_owner=nil, state, quote_effective_date, lob, env)

    puts " Effective date if less than current date or  is not provided, defaulting to current date"
    date = Date.today.strftime('%m/%d/%Y')
    if quote_effective_date.to_s < date
      quote_date = date
    elsif quote_effective_date.to_s.strip.empty?
      quote_date = date
    else
      quote_date = quote_effective_date
    end


    $agent_type = agent_type
    $state_name = state
    $lob = lob
    $env = env
    puts " State of operation : #{$state_name}"
    puts " LOB = #{$lob}"
    puts " env = #{$env}"
    puts "--- setup 2 ----"

    # internal - IA and EA
    if agent_type.include? "Internal"
      agency_number =  agency_number ? agency_number : "29900"
      ciq_setup1(agency_number.to_s.strip)
      self.underwriterID ="123" if $channel == "nwag"
      producer_code_element.select("001") if producer_code
      underwriter_element.select("ZZ1") if underwrite_id
      self.effective_date = quote_date
      click_tab
      sleep 2
      self.state_dropdown
      @browser.checkbox(:value => state).set
      sleep 2
      click_tab
      sleep 2
      call_setupmethods(state, business_owner, lob)
    end

    if agent_type.include? "External"
      sleep 5
      puts "---- creating quote for external user ---"
      puts "count of windows : #{@browser.windows.count}"
      @browser.window(:index => 1).use
      @browser.send_keys :tab
      producer_code_element.select("001") if producer_code_element.present?
      underwriter_element.select("ZZ1") if underwriter_element.present?
      puts "Is effective date element present: #{effective_date_element.present?}"
      self.effective_date = quote_date
      click_tab
      sleep 2
      self.state_dropdown
      sleep 3
      @browser.checkbox(:value => $state_name).set
      sleep 2
      click_tab
      sleep 2
      call_setupmethods(state, business_owner, lob)
    end

=begin
    def get_channel
      puts "---------------------------------"
      begin
        puts " trying to get the channel"
        $channel = @browser.span(:class, %w("form-control-static ng-binding")).text #@browser.ul(:xpath=> "//*[@id='accountSetupForm_agencyProductAndAccountChannel']/li[1]/span").text
        puts "Channel :#{$channel}"
      rescue Exception => e
        puts e.message
      end
    end
=end

  end

end



