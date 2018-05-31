using System;
using System.ComponentModel.DataAnnotations;
using Xalag.Properties;

namespace Xalag.Models
{
    public class SessionModel
    {
        [Display(ResourceType = typeof(Resources), Name = "PlaceId")]
        public  int PlaceId { get; set; }

        [Display(ResourceType = typeof(Resources), Name = "Title")]
        public string Title { get; set; }

        [Display(ResourceType = typeof(Resources), Name = "SubTitle")]
        public string SubTitle { get; set; }

        [Display(ResourceType = typeof(Resources), Name = "PlaceName")]
        public string PlaceName { get; set; }

        [Display(ResourceType = typeof(Resources), Name = "SessionDateTime")]
        public DateTime SessionDateTime { get; set; }

        [Display(ResourceType = typeof(Resources), Name = "NumberOfSeats")]
        public int? NumberOfSeats { get; set; }

        [Display(ResourceType = typeof(Resources), Name = "MaxReservedChairPerUser")]
        public int? MaxReservedChairPerUser { get; set; }
    }
}