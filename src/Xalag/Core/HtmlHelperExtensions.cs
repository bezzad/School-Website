using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace Xalag.Core
{
    public static class HtmlHelperExtensions
    {
        public static MvcHtmlString MultipleStepProgressTab(this HtmlHelper htmlHelper, MultipleStepProgressTabOption opt)
        {
            if (opt == null) throw new ArgumentNullException(nameof(opt));

            var style =
                $@"<style>
                    /*form styles*/
                    #msform {{
                        width: 100%;
                        margin: 50px auto;
                        text-align: center;
                        position: relative;
                    }}

                    /*progressbar*/
                    #sprogressbar {{
                        overflow: hidden;
                        /*CSS counters to number the steps*/
                        counter-reset: step;
                    }}

                        #sprogressbar li {{
                            list-style-type: none;
                            color: {opt.StepTextColor};
                            text-align: center;
                            font-size: 14px;
                            width: {100 / opt.Steps.Count}%;
                            float: left;
                            position: relative;
                        }}

                            /* circle nodes */
                            #sprogressbar li:before {{
                                content: counter(step);
                                counter-increment: step;
                                display: block;
                                background: {opt.NodeBackground};
                                color: {opt.NodeBorderColor};
                                border: 2px solid {opt.NodeBorderColor};
                                border-radius: 100%;
                                width: 25px;
                                height: 25px;
                                margin: 0 auto 5px auto;
                                padding-right: 1px;
                            }}

                            /*progressbar connectors*/
                            #sprogressbar li:after {{
                                content: '';
                                width: 100%;
                                height: 2px;
                                background: {opt.NodeBorderColor};
                                position: absolute;
                                left: -50%;
                                top: 12px;
                                z-index: -1; /*put it behind the numbers*/
                            }}

                            #sprogressbar li:first-child:after {{
                                /*connector not needed before the first step*/
                                content: none;
                            }}

                            /*marking active/completed steps green*/
                            /*The number of the step and the connector before it = green*/
                            #sprogressbar li.active:before, #sprogressbar li.active:after {{
                                background: {opt.SelectedNodeBackground};
                                color: {opt.NodeBorderColor};
                                padding-right: 1px;
                            }}

                            /*circle border color*/
                            #sprogressbar li.active:before {{
                                border: 2px solid {opt.SelectedNodeBackground};
                            }}
                    </style> {Environment.NewLine}";

            var div = new TagBuilder("div");
            div.Attributes.Add("id", "msform");

            var lis = "";

            if (opt.Steps != null && opt.Steps.Any())
            {
                for (var index = 0; index < opt.Steps.Count; index++)
                {
                    if (index < opt.CurrentStepIndex)
                        // selected step
                        lis += $"<li class='active'>{opt.Steps[index]}</li>{Environment.NewLine}";
                    else
                        lis += $"<li>{opt.Steps[index]}</li>{Environment.NewLine}";
                }
            }

            var body = $"<!-- progressbar -->{Environment.NewLine}";
            body += $@"<ul id=""sprogressbar"">{Environment.NewLine}{lis}</ul>";


            div.InnerHtml = body;

            return MvcHtmlString.Create(style + div.ToString());
        }
    }
}