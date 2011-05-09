# Import legacy data retrieved from an access database using mdbtools

def csv_file_to_hash(file)
  csv_data     = FasterCSV.read(file)
  headers      = csv_data.shift.map {|i| i.to_s }
  string_data  = csv_data.map {|row| row.map {|cell| cell.to_s } }
  string_data.map {|row| Hash[*headers.zip(row).flatten] }
end

# ##########################################################
# Import distributors
puts 'Importing distributors...'

old_distributors = csv_file_to_hash(File.join(Rails.root, 'db', 'seeds', 'tblDistributors.csv'))

# dID,dName,dInitials,dDescription,dLogo,dInterests,dTerms,dTAC,isDeleted
old_distributors.each do |old_distributor|
  distributor             = Distributor.find_or_initialize_by_id(old_distributor['dID'])
  distributor.name        = old_distributor['dName']
  distributor.initials    = old_distributor['dInitials']
  distributor.description = old_distributor['dDescription']
  distributor.logo        = old_distributor['dLogo']
  distributor.interests   = old_distributor['dInterests']
  distributor.terms       = old_distributor['dTerms']
  distributor.tac         = old_distributor['dTAC']
  distributor.is_deleted  = old_distributor['isDeleted']
  puts distributor.save
end

##########################################################
# Import Offers
puts 'Importing offers...'

old_offers = csv_file_to_hash(File.join(Rails.root, 'db', 'seeds', 'tblOffers.csv'))

# oID,dID,oParent,oName,oDescription,oBody,oLink,oSubLink,isPublic,isDeleted
old_offers.each do |old_offer|
  offer                = Offer.find_or_initialize_by_id(old_offer['oID'])
  offer.distributor_id = old_offer['dID']
  offer.parent_id      = old_offer['oParent']
  offer.description    = old_offer['oDescription']
  offer.body           = old_offer['oBody']
  offer.link           = old_offer['oLink']
  offer.sublink        = old_offer['oSubLink']
  offer.is_public      = old_offer['isPublic']
  offer.is_deleted     = old_offer['isDeleted']
  puts offer.save
end

##########################################################
# Import Pages
puts 'Importing pages...'

old_pages = csv_file_to_hash(File.join(Rails.root, 'db', 'seeds', 'tblPages.csv'))

# pID,pTitle,pComments,pBody,isPublic,isDeleted
old_pages.each do |old_page|
  page            = Page.find_or_initialize_by_id(old_page['pID'])
  page.title      = old_page['pTitle']
  page.comments   = old_page['pComments']
  page.body       = old_page['pBody']
  page.is_public  = old_page['is_public']
  page.is_deleted = old_page['isDeleted']
  puts page.save
end

# ##########################################################
# # Import Saveds
# puts 'Importing saveds...'
# 
# old_saveds = csv_file_to_hash(File.join(Rails.root, 'db', 'seeds', 'tblSaved.csv'))
# 
# # sID, uID, oID, sType, sTXT, sNum, sDMY, dtHealth, dtAuto, dtGeneral, dtProperty, dtUmbrella, isDeleted
# old_saveds.each do |old_saved|
#   saved                = Saved.find_or_initialize_by_id(old_saved['sID'])
#   saved.user_id        = old_saved['uID']
#   saved.offer_id       = old_saved['oID']
#   saved.saved_type     = old_saved['sType']
#   saved.text           = old_saved['sTXT']
#   saved.number         = old_saved['sNum']
#   saved.day_month_year = old_saved['sDMY']
#   saved.health         = old_saved['dtHealth']
#   saved.auto           = old_saved['dtAuto']
#   saved.general        = old_saved['dtGeneral']
#   saved.property       = old_saved['dtProperty']
#   saved.umbrella       = old_saved['dtUmbrella']
#   saved.is_deleted     = old_saved['is_deleted']
#   puts saved.save
# end
# 
##########################################################
# Import Users
puts 'Importing users...'

old_users = csv_file_to_hash(File.join(Rails.root, 'db', 'seeds', 'tblUsers.csv'))

# uID, dID, uUser, uPass, uLogins, uFirstName, uLastName, uCompany, uAnnualVolume, uAddress, uCity, uState, uZip, uOfficePhone, uMobilePhone, uFax, uWebsite, uSignedUp, uLastLogin, uNew, isAdmin, isUpdated, isActive, isDeleted
old_users.each do |old_user|
  user                = User.find_or_initialize_by_id(old_user['uID'])
  user.distributor_id = old_user['dID']
  user.username       = old_user['uUser']
  user.password       = old_user['uPass']
  user.logins         = old_user['uLogins']
  user.name_first     = old_user['uFirstName']
  user.name_last      = old_user['uLastName']
  user.company        = old_user['uCompany']
  user.annual_volume  = old_user['uAnnualVolume']
  user.address        = old_user['uAddress']
  user.city           = old_user['uCity']
  user.state          = old_user['uState']
  user.zip_code       = old_user['uZip']
  user.phone_office   = old_user['uOfficePhone']
  user.phone_cell     = old_user['uMobilePhone']
  user.fax            = old_user['uFax']
  user.website        = old_user['uWebsite']
  user.signed_up      = old_user['uSignedUp']
  user.last_login     = old_user['uLastLogin']
  user[:new]          = old_user['uNew']
  user.is_admin       = old_user['isAdmin']
  user.is_updated     = old_user['isUpdated']
  user.is_active      = old_user['isActive']
  user.is_deleted     = old_user['isDeleted']

  puts user.save
end

##########################################################
# Import Interests
puts 'Importing interests...'

old_interests = csv_file_to_hash(File.join(Rails.root, 'db', 'seeds', 'tblSaved.csv'))

# sID, uID, oID, sType, sTXT, sNum, sDMY, dtHealth, dtAuto, dtGeneral, dtProperty, dtUmbrella, isDeleted
old_interests.each do |old_interest|
  interest                = Interest.find_or_initialize_by_user_id_and_offer_id(old_interest['uID'], old_interest['oID'])
  interest.user_id        = old_interest['uID']
  interest.offer_id       = old_interest['oID']
  interest.response       = old_interest['sTXT']
  interest.is_deleted     = old_interest['is_deleted']

  puts interest.save
end
